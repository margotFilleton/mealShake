//
//  GoogleAPIHttp.swift
//  mealShake
//
//  Created by Margot Filleton on 01/10/2017.
//  Copyright © 2017 Margot Filleton. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

class GoogleApiPlace {
  
    //Get all places nearby the location
    static func getPlaces(latitude: String, longitude : String, done: @escaping (String)->Void){
        let url = "https://maps.googleapis.com/maps/api/place/radarsearch/json?location="+latitude+","+longitude+"&radius=50&type=restaurant&key="+APIkey.googleMapsAPIKey
        Alamofire.request(url).responseString{ response in
            if let dataFromNetworking = response.result.value {
             //  print(dataFromNetworking)
                done(dataFromNetworking)
            }
        }
    }
    
    //Get a random placesID nearby the location
    static func getplaceId(latitude: String, longitude : String){
        self.getPlaces(latitude: latitude, longitude : longitude, done: {dataFromNetworking in
            if let dataFromString = dataFromNetworking.data(using: .utf8, allowLossyConversion: false) {
                let json = JSON(data: dataFromString)
                if let placeId = json["results"][0]["place_id"].string {
                    print(placeId)
                }
            }
        })
    }
    
    
    
}
