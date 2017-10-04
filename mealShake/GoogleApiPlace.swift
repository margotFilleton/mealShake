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
import CoreLocation

class GoogleApiPlace {
  
    //Get all places nearby the location
    static func getPlacesRequest(latitude: String, longitude : String, done: @escaping (String)->Void){
        let url = "https://maps.googleapis.com/maps/api/place/radarsearch/json?location="+latitude+","+longitude+"&radius=50&type=restaurant&key="+APIkey.googleMapsAPIKey
        Alamofire.request(url).responseString{ response in
            if let data = response.result.value {
               //print(data)
                done(data)
            }
        }
    }
    
    //Get a random placesID nearby the location
    static func getplaceId(latitude: String, longitude : String, done: @escaping (String)->Void){
        self.getPlacesRequest(latitude: latitude, longitude : longitude, done: {places in
            if let placesData = places.data(using: .utf8, allowLossyConversion: false) {
                let jsonPlacesData = JSON(data: placesData)
                let nbResult: Int = jsonPlacesData["results"].count
                let randomNumber = arc4random_uniform(UInt32(nbResult))
                if let placeId = jsonPlacesData["results"][Int(randomNumber)]["place_id"].string {
                    //print(placeId)
                    done(placeId)
                }
            }
        })
    }
   
    //Get a detail of the place with its placesID
    static func getDetailsPlaceRequest(placeId: String, done: @escaping (String)->Void){
        let url = "https://maps.googleapis.com/maps/api/place/details/json?placeid="+placeId+"&key="+APIkey.googleMapsAPIKey
        Alamofire.request(url).responseString{ response in
            if let data = response.result.value {
                //print(data)
                done(data)
            }
        }
    }
   
  
    
    //photos
    //name
    //location
    //geometry -- location -- lat lng
    //formatted_address
    
    //Get a random placesID nearby the location
    static func getDetailsPlace(placeId: String, done: @escaping (String)->Void){
        self.getDetailsPlaceRequest(placeId: placeId, done: {placeDetailsJson in
            if let placeDetails = placeDetailsJson.data(using: .utf8, allowLossyConversion: false) {
                let placeDetailsData = JSON(data: placeDetails)
                var photoRef: String
                var restaurant = Restaurant(photo: "", name: "", adresse: "", location: CLLocation())
                if let lat = placeDetailsData["result"]["geometry"]["location"]["lat"].double {
                     if let lng = placeDetailsData["result"]["geometry"]["location"]["lng"].double {
                        restaurant.location = CLLocation(latitude: lat, longitude: lng)
                    }
                }
                if let photo = placeDetailsData["result"]["photos"][0]["photo_reference"].string {
                    photoRef = photo
                 print(photoRef)
                }
                if let name = placeDetailsData["result"]["name"].string {
                     restaurant.name = name
                }
                if let adresse = placeDetailsData["result"]["formatted_address"].string {
                     restaurant.adresse = adresse
                }
  
                print(restaurant.name)
                print(restaurant.adresse)
                print(String(describing: restaurant.location))
            }
        })
    }
    
    
}
