//
//  PetHealthRepository.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/3/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation

class PetHealthRepository{
    let settings = UserDefaults.standard
    
    var userId: Int? {
        get{
            return settings.integer(forKey: "savedUserId")
        }
        set{
            if let userId = newValue as Int? {
                settings.set(userId, forKey: "savedUserId")
                return
            }
            //settings.removeObject(forKey: "savedUserId")
        }
    }
    
    var userPhoto: String? {
        get{
            return settings.string(forKey: "savedUserPhoto")!
        }
        set{
            if let userPhoto = newValue as String? {
                settings.set(userPhoto, forKey: "savedUserPhoto")
                return
            }
            //settings.removeObject(forKey: "savedUserPhoto")
        }
    }
    
    var accessTokenAuthentication: String? {
        get{
            return settings.string(forKey: "savedAccessToken")!
        }
        set{
            if let accessToken = newValue as String? {
                settings.set(accessToken, forKey: "savedAccessToken")
                return
            }
            //settings.removeObject(forKey: "savedAccessToken")
        }
    }
    
}
