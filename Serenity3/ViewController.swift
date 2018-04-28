//
//  ViewController.swift
//  Serenity3
//
//  Created by Jarne Thorrez on 28/04/2018.
//  Copyright © 2018 Jarne Thorrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    
    func loadJson() {
        
        let path = Bundle.main.path(forResource: "cities", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let citiesLocal = try JSONDecoder().decode([String: city].self, from: data)

            cities = citiesLocal
            
            print(cities)
            
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

