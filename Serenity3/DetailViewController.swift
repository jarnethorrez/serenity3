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
//        print(selectedCity!);
        
        locationImage.image = UIImage(named: "0_big")
        locationName.text = selectedCity!.naam
        location.text = selectedCity!.locatie
        locationAdres.text = selectedCity!.adres
        locationCity.text = selectedCity!.stad
        
        locationAbout.sizeToFit()
        locationAbout.text = selectedCity!.over
        
    }
    
    override func viewDidLayoutSubviews() {
        
        var contentRect = CGRect.zero
        
        print("subviews")
        for view in scrollView.subviews {
            print(view.frame)
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
        
        print("content size")
        print(scrollView.contentSize)
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
