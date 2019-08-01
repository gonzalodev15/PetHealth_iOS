//
//  AppointmentDetailViewController.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/1/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import UIKit

class AppointmentDetailViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bdateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var apptDateLabel: UILabel!
    @IBOutlet weak var veterinarianLabel: UILabel!
    @IBOutlet weak var appointmentDescriptionLabel: UILabel!

    var appointmentResponse: AppointmentResponse? {
        didSet{
            print("set: \(appointmentResponse!.appointment.id)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let appointmentResponse = appointmentResponse{
            nameLabel.text = appointmentResponse.pet.name
            raceLabel.text = appointmentResponse.pet.race
            descriptionLabel.text = appointmentResponse.pet.description
            bdateLabel.text = appointmentResponse.pet.birth_date
            typeLabel.text = appointmentResponse.appointment.type
            apptDateLabel.text = appointmentResponse.appointment.appt_date
            veterinarianLabel.text = appointmentResponse.veterinarian.name
            appointmentDescriptionLabel.text = appointmentResponse.appointment.desc
            if let url = URL(string: appointmentResponse.pet.image_url){
                pictureImageView.af_setImage(withURL: url)
            }
            
        }

        // Do any additional setup after loading the view.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
