//
//  MainViewController.swift
//  mealShake
//
//  Created by Margot Filleton on 09/04/2017.
//  Copyright © 2017 Margot Filleton. All rights reserved.
//

import UIKit
import GoogleMaps

class MainViewController: UIViewController {
    var userLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.mainColor
    }

    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        //TODO loader wait location
        userLocation = GoogleMapsManager.instance.getUserLocation()
        
        print("Device was shaken!")
        print(userLocation ?? "location not set")
    }
}
