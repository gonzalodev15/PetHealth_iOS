//
//  AppointmentResponse.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import Foundation
import SwiftyJSON

class AppointmentResponse{
    var appointment: Appointment
    var pet: Pet
    var veterinarian: Veterinarian
    var veterinary: Veterinary
    
    init(appointment: Appointment, pet: Pet, veterinarian: Veterinarian,
         veterinary: Veterinary){
        self.appointment = appointment
        self.pet = pet
        self.veterinarian = veterinarian
        self.veterinary = veterinary
    }
    
    convenience init(jsonAppointmentResponse: JSON) {
        self.init(appointment: Appointment(jsonAppointment: JSON(jsonAppointmentResponse["appointment"])),
                  pet: Pet(jsonPet: JSON(jsonAppointmentResponse["pet"])),
                  veterinarian: Veterinarian(jsonVeterinarian: JSON(jsonAppointmentResponse["veterinarian"])),
                  veterinary: Veterinary(jsonVeterinary: JSON(jsonAppointmentResponse["veterinary"]))
        )
    }
    
    static func buildAll(from jsonAppointmentResponses: [JSON]) -> [AppointmentResponse]{
        var responses: [AppointmentResponse] = []
        let count = jsonAppointmentResponses.count
        for i in 0 ..< count {
            responses.append(AppointmentResponse(jsonAppointmentResponse: JSON(jsonAppointmentResponses[i])))
        }
        return responses
    }
}

