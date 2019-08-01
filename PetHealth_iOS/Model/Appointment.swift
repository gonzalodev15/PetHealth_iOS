//
//  Appointment.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation
import SwiftyJSON

class Appointment{
    var id: Int
    var appt_date: String
    var desc: String
    var status: String
    var start_t: String
    var end_t: String
    var register_date: String
    var pet_photo: String
    var pet_id: Int?
    var vet_id: Int?
    var veterinary_id: Int?
    var type: String
    
    init(id: Int, appt_date: String, desc: String, status: String, start_t: String,
         end_t: String, register_date: String, pet_photo: String, pet_id: Int?, vet_id: Int?,
         veterinary_id: Int?, type: String) {
        self.id = id
        self.appt_date = appt_date
        self.desc = desc
        self.status = status
        self.start_t = start_t
        self.end_t = end_t
        self.register_date = register_date
        self.pet_photo = pet_photo
        self.pet_id = pet_id
        self.vet_id = vet_id
        self.veterinary_id = veterinary_id
        self.type = type
    }
    
    convenience init(){
        self.init(id: 0, appt_date: "", desc: "", status: "", start_t: "",
                  end_t: "", register_date: "", pet_photo: "", pet_id: 0, vet_id: 0,
                  veterinary_id: 0, type: ""
        )
    }
    
    convenience init(jsonAppointment: JSON) {
        self.init(
            id: jsonAppointment["id"].intValue,
            appt_date: jsonAppointment["appt_date"].stringValue,
            desc: jsonAppointment["desc"].stringValue,
            status: jsonAppointment["status"].stringValue,
            start_t: jsonAppointment["start_t"].stringValue,
            end_t: jsonAppointment["end_t"].stringValue,
            register_date: jsonAppointment["register_date"].stringValue,
            pet_photo: jsonAppointment["pet_photo"].stringValue,
            pet_id: jsonAppointment["pet_id"].intValue,
            vet_id: jsonAppointment["vet_id"].intValue,
            veterinary_id: jsonAppointment["veterinary_id"].intValue,
            type: jsonAppointment["type"].stringValue)
    }
    
    static func buildAll(from jsonAppointments: [JSON]) -> [Appointment]{
        var appointments: [Appointment] = []
        let count = jsonAppointments.count
        for i in 0 ..< count {
            appointments.append(Appointment(jsonAppointment: JSON(jsonAppointments[i])))
        }
        return appointments
    }
}
