//
//  Veterinarian.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation
import SwiftyJSON

class Veterinarian{
    var id: Int
    var name: String
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
    convenience init() {
        self.init(id: 0,
                  name: "")
    }
    convenience init(jsonVeterinarian: JSON) {
        self.init(
            id: jsonVeterinarian["id"].intValue,
            name: jsonVeterinarian["name"].stringValue
        )
    }
    
    static func buildAll(from jsonVeterinarians: [JSON])->[Veterinarian]{
        var veterinarians: [Veterinarian] = []
        let count = jsonVeterinarians.count
        for i in 0 ..< count {
            veterinarians.append(Veterinarian(jsonVeterinarian: JSON(jsonVeterinarians[i])))
        }
        return veterinarians
    }
}
