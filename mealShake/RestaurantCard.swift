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
	private var adress: UITextView
    private let backgroundView: UIView
    
    init(frame: CGRect, restaurant: Restaurant) {
        
      
        backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        title = UILabel(frame: CGRect(x: 10, y: (frame.height/3) + 40, width: frame.width - 20, height: 80))
        title.text = restaurant.name
  
        title.numberOfLines = 0
        title.textColor = Theme.textColor
        //title.sizeToFit()
        title.font = UIFont.boldSystemFont(ofSize: 28.0)
        //title.backgroundColor = Theme.mainColorSecondary
        
        adress = UITextView(frame: CGRect(x: 10, y: title.frame.maxY, width: frame.width - 20, height: 80))
        adress.text = restaurant.adresse
        adress.textColor = Theme.textColor
        adress.font = UIFont.boldSystemFont(ofSize: 18.0)
       // adress.backgroundColor = Theme.mainColor
        let shadowLayer = CALayer()
        
        super.init(frame: frame)
        
        shadowLayer.cornerRadius = 10
        shadowLayer.shadowOffset = CGSize(width: 0, height: 4)
        shadowLayer.shadowColor = UIColor(hex: 0x0A0A0A).cgColor
        shadowLayer.shadowRadius = 8
        shadowLayer.shadowOpacity = 0.6
        shadowLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        shadowLayer.backgroundColor = UIColor.white.cgColor
       
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
        
        let photoView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height/3 + 20))
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        photoView.image = restaurant.photo
        
        let starRank = StarRankView(frame: CGRect(x: 0, y: adress.frame.maxY, width: frame.width, height: frame.height/3 + 20), rank: restaurant.rank)

        let sizeGoto: CGFloat = 60
        let btnGoto = Goto(frame: CGRect(x: (frame.width - sizeGoto) - 20, y: (photoView.frame.maxY) - sizeGoto/2, width: sizeGoto, height: sizeGoto), location: restaurant.location)
        
        layer.addSublayer(shadowLayer)
        addSubview(backgroundView)
        backgroundView.addSubview(title)
        backgroundView.addSubview(starRank)
        backgroundView.addSubview(adress)
        backgroundView.addSubview(photoView)
        backgroundView.addSubview(btnGoto)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
