//
//  AppointmentDetailViewController.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/1/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import UIKit
import Alamofire


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
            print("set: \(appointmentResponse!.veterinarian.name)")
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
    

    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func showAlertController(_ sender: Any) {
        var motiveTextField: UITextField?
        var diagnoseTextField: UITextField?
        
        // 2.
        let alertController = UIAlertController(
            title: "Finish Appointment",
            message: "Enter the motive and diagnose",
            preferredStyle: .alert)
        
        // 3.
        let acceptAction = UIAlertAction(
        title: "Accept", style: .default) {
            (action) -> Void in
            
            if let motive = motiveTextField?.text {
                print("Motive = \(motive)")
            } else {
                print("No motive entered")
            }
            
            if let diagnose = diagnoseTextField?.text {
                print("Diagnose = \(diagnose)")
            } else {
                print("No diagnose entered")
            }
            self.finishAppointment(motive: motiveTextField!.text!, diagnose: diagnoseTextField!.text!)
            alertController.dismiss(animated: true)
            self.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(
        title: "Cancel", style: .default) {
            (action) -> Void in
            alertController.dismiss(animated: true)
            
        }
        
        // 4.
        alertController.addTextField {
            (txtMotive) -> Void in
            motiveTextField = txtMotive
            motiveTextField!.placeholder = "Motive"
        }
        
        alertController.addTextField {
            (txtDiagnose) -> Void in
            diagnoseTextField = txtDiagnose
            diagnoseTextField!.placeholder = "Diagnose"
        }
        
        // 5.
        alertController.addAction(acceptAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func finishAppointment(motive: String, diagnose: String){
        let parameters = [ "motive" : motive , "diagnosis" : diagnose ]
        let headers: HTTPHeaders = ["access_token" : repository.accessTokenAuthentication! ]
        
        Alamofire.AF.request(PetHealthApi.finishAppointmentUrl(appointmentId: appointmentResponse!.appointment.id), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate().responseJSON(completionHandler: { response in
                switch response.result{
                case .success(let value):
                    print(value)
                    print("Appointment Finished!")
                    
                case .failure(let error):
                    print("Response Error: \(error.localizedDescription)")
                
                }
            
        })
    }

}
