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
    let shake = UIImage(named: "shakeImgWhite")
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.mainColor
       let shakeView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        shakeView.contentMode = .scaleAspectFit
        shakeView.image = shake
        view.addSubview(shakeView)
    }

    //Device Shaken
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        //TODO loader wait location
        userLocation = GoogleMapsManager.instance.getUserLocation()
        if userLocation != nil {
            GoogleApiPlace.getplaceId(latitude: String(describing: userLocation!.coordinate.latitude),longitude: String(describing: userLocation!.coordinate.longitude),done: {placeId in
                GoogleApiPlace.getDetailsPlace(placeId: placeId,done: {restaurant in
                    
                })
            })
        }
        else{
            print("location not set")
        }
 
    }
}
