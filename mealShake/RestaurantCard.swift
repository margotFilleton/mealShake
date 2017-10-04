//
//  RestaurantCard.swift
//  mealShake
//
//  Created by Margot Filleton on 04/10/2017.
//  Copyright © 2017 Margot Filleton. All rights reserved.
//

import Foundation
import UIKit

class RestaurantCard: UIView {
    
    var action = {}
    private var title: UILabel
    
     init(frame: CGRect, restaurant: Restaurant) {
        title = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        title.text = restaurant.name
        title.numberOfLines = 1
        title.textColor = Theme.textColor
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 30.0)
        title.adjustsFontSizeToFitWidth = true
        
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = UIColor(hex: 0x0A0A0A).cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.6
        
        
        
        addSubview(title)
      /*  let photoView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: (frame.height/2)-20))
        photoView.contentMode = .scaleAspectFit
        photoView.image = restaurant.photo*/
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
