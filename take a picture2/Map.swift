//
//  Map.swift
//  take a picture2
//
//  Created by Erik Ostrovski on 24/08/2021.
//

import CoreLocation
import MapKit
import UIKit

class map:UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let manager = CLLocationManager()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
        
            render(location)
        
        }
    }
    
    func render(_ location: CLLocation) {
        mapView
    }
    
    
}
