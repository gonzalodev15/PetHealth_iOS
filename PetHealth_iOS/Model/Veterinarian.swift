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

    var name: String
    
    init(name: String){
        self.name = name
    }
    
    convenience init() {
        self.init(name: "")
    }
    convenience init(jsonVeterinarian: JSON) {
        self.init(
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
