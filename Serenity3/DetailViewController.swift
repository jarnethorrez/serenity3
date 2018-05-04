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
    
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem?.title = "Back"
        
        locationImage.image = UIImage(named: "\(String(describing: id!))_big")
        locationName.text = selectedCity!.naam
        location.text = selectedCity!.locatie
        locationAdres.text = "\(selectedCity!.postcode) \(selectedCity!.stad)"
        locationCity.text = selectedCity!.adres
        
        locationAbout.text = selectedCity!.over
        locationAbout.sizeToFit()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        var contentRect = CGRect.zero
        
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        scrollView.contentSize = contentRect.size
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
