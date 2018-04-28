//
//  ViewController.swift
//  Serenity3
//
//  Created by Jarne Thorrez on 28/04/2018.
//  Copyright © 2018 Jarne Thorrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var locationTable: UITableView!
    
    struct city:Decodable {
        let naam: String
        let locatie: String
        let adres: String
        let stad: String
        let over: String
    }
    
    var cities: [String: city] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadJson()
        locationTable.delegate = self
        locationTable.dataSource = self
    }
    
    func loadJson() {
        
        let path = Bundle.main.path(forResource: "cities", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            cities = try JSONDecoder().decode([String: city].self, from: data)
        } catch {
            print(error)
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
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTable.dequeueReusableCell(withIdentifier: "locationCell") as! locationTableViewCell
        
        print("yow")
        
        cell.locationImage.image = UIImage(named: "\(indexPath.row)")
        cell.locationName.text = cities["\(indexPath.row)"]?.naam
        return cell
    }


}

