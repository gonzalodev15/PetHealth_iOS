//
//  ClinicHistory.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//


import Foundation
import SwiftyJSON

class ClinicHistory{
    var id: Int
    var motive: String
    var diagnosis: String
    var appointmentId: Int?
    var pet_id: Int?
    
    init(id: Int, motive: String, diagnosis: String, appointmentId: Int?, pet_id: Int?){
        self.id = id
        self.motive = motive
        self.diagnosis = diagnosis
        self.appointmentId = appointmentId
        self.pet_id = pet_id
    }
    
    convenience init(){
        self.init(id: 0, motive: "", diagnosis: "", appointmentId: 0, pet_id: 0)
    }
    
    convenience init(jsonClinicHistory: JSON){
        self.init(
            id: jsonClinicHistory["id"].intValue,
            motive: jsonClinicHistory["motive"].stringValue,
            diagnosis: jsonClinicHistory["diagnosis"].stringValue,
            appointmentId: 0,
            pet_id: 0
        )
    }
}
