//
//  Goto.swift
//  mealShake
//
//  Created by Margot Filleton on 08/10/2017.
//  Copyright © 2017 Margot Filleton. All rights reserved.
//

import Foundation
import UIKit
import Tactile
import CoreLocation

class Goto: UIView {
    
    let sizeCircle: CGFloat = 140
    private var iconView: UILabel
    
    let lat: CLLocationDegrees
	let lng: CLLocationDegrees
    
     init(frame: CGRect, location: CLLocation) {
       let icon: String = ""
        lat = location.coordinate.latitude
        lng = location.coordinate.longitude
        
        iconView = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        super.init(frame: frame)
        self.backgroundColor = Theme.mainColorSecondary
        self.layer.cornerRadius = min(self.frame.width, self.frame.height)/2
  
        iconView.text = icon
        iconView.font = UIFont(name: "MaterialIcons-Regular", size: 40)
        iconView.textColor = UIColor.white
        iconView.textAlignment = .center
        
        
        addSubview(iconView)
        
        tap(tapped)
    }
    
    
    func tapped(tap: UITapGestureRecognizer) {

        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            UIApplication.shared.open(URL(string:"comgooglemaps://?saddr=&daddr=\(lat),\(lng)&directionsmode=driving")!)
        }
        else {
            print("Can't use comgooglemaps://");
        }
       
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
