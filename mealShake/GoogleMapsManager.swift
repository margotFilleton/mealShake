//
//  GoogleMapsManager.swift
//  mealShake
//
//  Created by Margot Filleton on 09/04/2017.
//  Copyright © 2017 Margot Filleton. All rights reserved.
//

import Foundation
import GoogleMaps
import UIKit

class GoogleMapsManager: NSObject, CLLocationManagerDelegate {
    static let instance = GoogleMapsManager()
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self

    }
    
    func getUserLocation() -> CLLocation? {
        return currentLocation
    }
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last!
        print("ok")
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
}
