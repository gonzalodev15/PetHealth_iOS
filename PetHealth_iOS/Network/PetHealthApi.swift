//
//  PetHealthApi.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation

class PetHealthApi {
    static let baseUrl = "https://pethealthapi.herokuapp.com/api"
    
    public static func appointmentsUrl(userid: Int) -> String{
        let url = "\(baseUrl)/users/\(userid)/appointments"
        return url
    }
    public static func userProfileUrl(userid: Int) -> String {
        return "\(baseUrl)/veterinaries/\(userid)"
    }
    
    public static var userLogin : String {
        return "\(baseUrl)/login"
    }
    
    public static func finishAppointmentUrl(appointmentId: Int)-> String {
        return "\(baseUrl)/appointments/\(appointmentId)/history"
    }
    
    public static func updateProfile(userId: Int) -> String {
        return "\(baseUrl)/veterinaries/\(userId)"
    }
    
}
