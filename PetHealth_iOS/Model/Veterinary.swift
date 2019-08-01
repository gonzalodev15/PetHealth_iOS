//
//  Veterinary.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//


import Foundation
import SwiftyJSON

class Veterinary{
    var id: Int?
    var social_url_id: Int
    var name: String
    var phone: String
    var location: String
    var opening_hours: String
    var longitude: Double
    var latitude: Double
    var logo: String?
    
    init( id: Int?, social_url_id: Int, name: String, phone: String, location: String,
          opening_hours: String, longitude: Double, latitude: Double, logo: String?){
        self.id = id
        self.social_url_id = social_url_id
        self.name = name
        self.phone = phone
        self.location = location
        self.opening_hours = opening_hours
        self.longitude = longitude
        self.latitude = latitude
        self.logo = logo
    }
    
    convenience init() {
        self.init(id: 0, social_url_id: 0, name: "", phone: "", location: "", opening_hours: "", longitude: 0.00, latitude: 0.00, logo: "")
    }
    
    convenience init(jsonVeterinary: JSON){
        self.init(
            id: jsonVeterinary["id"].intValue,
            social_url_id: jsonVeterinary["social_url_id"].intValue,
            name: jsonVeterinary["name"].stringValue,
            phone: jsonVeterinary["phone"].stringValue,
            location: jsonVeterinary["location"].stringValue,
            opening_hours: jsonVeterinary["opening_hours"].stringValue,
            longitude: jsonVeterinary["longitude"].doubleValue,
            latitude: jsonVeterinary["latitude"].doubleValue,
            logo: jsonVeterinary["logo"].stringValue
        )
    }
    
    static func buildAll(from jsonVeterinaries: [JSON]) -> [Veterinary]{
        var veterinaries: [Veterinary] = []
        let count = jsonVeterinaries.count
        for i in 0 ..< count {
            veterinaries.append(Veterinary(jsonVeterinary: JSON(jsonVeterinaries[i])))
        }
        return veterinaries
    }
}
