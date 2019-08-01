//
//  User.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/1/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation
import SwiftyJSON

class User{
    var id: Int
    var username: String
    var password: String
    var mail: String
    var photo: String
    var bio: String
    
    init( id: Int, username: String, password: String, mail: String, photo: String, bio: String){
        self.id = id
        self.username = username
        self.password = password
        self.mail = mail
        self.photo = photo
        self.bio = bio
    }
    
    convenience init(){
        self.init(id: 0, username: "", password: "", mail: "", photo: "", bio: "")
    }
    
    convenience init(jsonUser: JSON){
        self.init(
            id: jsonUser["id"].intValue,
            username: jsonUser["username"].stringValue,
            password: jsonUser["password"].stringValue,
            mail: jsonUser["mail"].stringValue,
            photo: jsonUser["photo"].stringValue,
            bio: jsonUser["bio"].stringValue
        )
    }
    
    static func buildAll(from jsonUsers: [JSON]) -> [User]{
        var users: [User] = []
        let count = jsonUsers.count
        for i in 0 ..< count {
            users.append(User(jsonUser: JSON(jsonUsers[i])))
        }
        return users
    }
}
