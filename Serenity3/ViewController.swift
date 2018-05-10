//
//  ViewController.swift
//  Serenity3
//
//  Created by Jarne Thorrez on 28/04/2018.
//  Copyright © 2018 Jarne Thorrez. All rights reserved.
//

import UIKit
import CoreLocation

struct city:Decodable {
    let naam: String
    let imageId: String
    let locatie: String
    let adres: String
    let stad: String
    let postcode: String
    let over: String
    let lat: Double
    let long: Double
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var locationTable: UITableView!
    @IBOutlet var locationLabel: UILabel!
    
    
    var cities: [String: city] = [:]
    var currentCity:String?
    var filteredCities: [String: city] = [:]
    var selectedIndex = 0;
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationTable.delegate = self
        locationTable.dataSource = self
        loadJson()
        
        if (UserDefaults.standard.string(forKey: "currentCity") != nil ) {
            currentCity = UserDefaults.standard.string(forKey: "currentCity")!
            
            if (locationLabel.text != currentCity) {
                locationLabel.text = currentCity
            }
            
        } else {
            self.getUserLocation()
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (UserDefaults.standard.string(forKey: "currentCity")! != currentCity) {
            currentCity = UserDefaults.standard.string(forKey: "currentCity")
            locationLabel.text = currentCity
            self.filter(filterOn: currentCity!)
            locationTable.reloadData()
        }
    }
    
    func getUserLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0]
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
        
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        
        currentCity = placemark!.locality!
        locationLabel.text = currentCity
        
    }
    
    func loadJson() {
        
        let path = Bundle.main.path(forResource: "cities", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            cities = try JSONDecoder().decode([String: city].self, from: data)
            
            self.filter(filterOn: "Gent");
            
            locationTable.reloadData()
        } catch {
            print(error)
        }
    }
    
    func filter(filterOn: String) {
        
        filteredCities.removeAll()
        
        cities.forEach {
            city in
            if (city.value.stad == filterOn) {
                filteredCities[city.key] = city.value
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTable.dequeueReusableCell(withIdentifier: "locationCell") as! locationTableViewCell
        
        var cityKeys = [Int]();
        
        filteredCities.forEach {
            city in
            cityKeys.append( Int(city.key)! )
        }
        
        cell.locationImage.image = UIImage(named: "\(cityKeys[indexPath.row])")
        cell.locationName.text = filteredCities["\(cityKeys[indexPath.row])"]?.naam
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            
            var cityKeys = [Int]();
            
            filteredCities.forEach {
                city in
                cityKeys.append( Int(city.key)! )
            }
            
            let detailVC = segue.destination as!  DetailViewController
            selectedIndex = (locationTable.indexPathForSelectedRow?.row)!
            detailVC.selectedCity = filteredCities["\(cityKeys[selectedIndex])"]!
            detailVC.id = locationTable.indexPathForSelectedRow?.row
        }
    }


}

