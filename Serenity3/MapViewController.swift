//
//  MapViewController.swift
//  Serenity3
//
//  Created by Jarne Thorrez on 09/05/2018.
//  Copyright © 2018 Jarne Thorrez. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    var longitude:Double?
    var latitude:Double?
    var locationName:String?
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let location = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        
        mapView.centerCoordinate = location
        mapView.region = MKCoordinateRegionMakeWithDistance(location, 1000, 1000)
        
        let locationPin = MKPointAnnotation()
        locationPin.title = locationName
        locationPin.coordinate = location
        
        mapView.addAnnotation(locationPin)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
