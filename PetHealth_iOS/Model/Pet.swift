//
//  Pet.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation
import SwiftyJSON

class Pet{
    var name: String
    var description: String
    var race: String
    var birth_date: String
    var status: String
    var image_url: String
    var owner_id: Int
    //var history: [ClinicHistory]
    
    init(name:String, description: String, race: String, birth_date: String,
         status: String, image_url: String, owner_id: Int){
        self.name = name
        self.description = description
        self.race = race
        self.birth_date = birth_date
        self.status = status
        self.image_url = image_url
        self.owner_id = owner_id
    }
    
    convenience init(){
        self.init(name: "", description: "", race: "", birth_date: "",
                  status: "", image_url: "", owner_id: 0)
    }
    
    convenience init(jsonPet: JSON) {
        self.init(
            name: jsonPet["name"].stringValue,
            description: jsonPet["description"].stringValue,
            race: jsonPet["race"].stringValue,
            birth_date: jsonPet["birth_date"].stringValue,
            status: jsonPet["status"].stringValue,
            image_url: jsonPet["image_url"].stringValue,
            owner_id: jsonPet["owner_id"].intValue
        )
    }
    
    static func buildAll(from jsonPets: [JSON]) -> [Pet]{
        var pets: [Pet] = []
        let count = jsonPets.count
        for i in 0 ..< count {
            pets.append(Pet(jsonPet: JSON(jsonPets[i])))
        }
        return pets
    }
}
