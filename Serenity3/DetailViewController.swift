//
//  DetailViewController.swift
//  Serenity3
//
//  Created by Jarne Thorrez on 29/04/2018.
//  Copyright © 2018 Jarne Thorrez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCity:city?;
    var id:Int?;
    
    @IBOutlet var locationName: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var locationAdres: UILabel!
    @IBOutlet var locationCity: UILabel!
    @IBOutlet var locationAbout: UILabel!
    @IBOutlet var locationImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem?.title = "Back"
        print(selectedCity!);
        
        locationName.text = selectedCity!.naam
        location.text = selectedCity!.locatie
        locationAdres.text = selectedCity!.adres
        locationCity.text = selectedCity!.stad
        locationAbout.text = selectedCity!.over
        locationImage.image = UIImage(named: "\(id)_big")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
