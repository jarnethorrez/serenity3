//
//  PickerViewController.swift
//  Serenity3
//
//  Created by Jarne Thorrez on 10/05/2018.
//  Copyright © 2018 Jarne Thorrez. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pickerView: UIPickerView!
    var selectedCity:String?
    
    let supportedCities = ["Kortrijk", "Gent"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return supportedCities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return supportedCities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = supportedCities[row]
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        if( selectedCity != nil) {
            print(selectedCity!)
            UserDefaults.standard.setValue(selectedCity, forKey: "currentCity")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        selectedCity = supportedCities[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
