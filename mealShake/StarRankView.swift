//
//  StarRank.swift
//  mealShake
//
//  Created by Margot Filleton on 08/10/2017.
//  Copyright © 2017 Margot Filleton. All rights reserved.
//

import Foundation
import UIKit

class StarRankView: UIView {
    
     private var starText: UITextView

    init(frame: CGRect, rank: Float) {
        let star: String = ""
        let starEmpty: String  = ""
        let starHalfEmpty: String  = ""
        
        let nbFullStar: Int = Int(rank)
        let nbHalft :Float = rank.truncatingRemainder(dividingBy: 1.0)
        var nbStar: Int = 5
        
        starText = UITextView(frame: CGRect(x: 10, y: 0, width: frame.width - 20, height: 40))
        starText.text = ""
        if(nbFullStar > 0){
            for _ in 1...nbFullStar {
                starText.text.append(star)
                nbStar -= 1
            }
        }
        if nbHalft > 0{
            starText.text.append(starHalfEmpty)
            nbStar -= 1
        }
        while nbStar > 0 {
            starText.text.append(starEmpty)
            nbStar -= 1
        }
        
        starText.font = UIFont(name: "fontawesome", size: 20)
        starText.textColor = Theme.mainColor
      
        super.init(frame: frame)
        
       
        addSubview(starText)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

