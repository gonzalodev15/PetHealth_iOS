//
//  LoginResponse.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/1/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginResponse{
    var user : User
    var accessToken : String
    var veterinary : Veterinary
    
    
    init(user: User, accessToken: String, veterinary: Veterinary){
        self.user = user
        self.accessToken = accessToken
        self.veterinary = veterinary
    }
    
    convenience init(jsonLoginResponse: JSON){
        self.init(user: User(jsonUser: JSON(jsonLoginResponse["user"])),
                  accessToken: jsonLoginResponse["access_token"].stringValue,
                  veterinary: Veterinary(jsonVeterinary: JSON(jsonLoginResponse["veterinary"]))
                  )
    }
    
    static func buildAll(from jsonLoginResponses: [JSON]) -> [LoginResponse]{
        var responses: [LoginResponse] = []
        let count = jsonLoginResponses.count
        for i in 0 ..< count {
            responses.append(LoginResponse(jsonLoginResponse: JSON(jsonLoginResponses[i])))
        }
        return responses
    }
    
}
