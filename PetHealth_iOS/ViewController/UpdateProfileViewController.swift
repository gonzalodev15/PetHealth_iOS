//
//  UpdateProfileViewController.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/4/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class UpdateProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var mailTextBox: UITextField!
    @IBOutlet weak var addressTextBox: UITextField!
    @IBOutlet weak var scheduleTextBox: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func saveUpdatedProfileAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func updateProfile(){
        let headers : HTTPHeaders = [ "access_token" : repository.accessTokenAuthentication!]
        let parameters = ["name": nameTextBox.text!, "location": addressTextBox.text!,
                          "opening_hours": scheduleTextBox.text!, "mail": mailTextBox.text!]
        
        Alamofire.AF.request(PetHealthApi.updateProfile(userId: repository.userId!), method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                print(value)
                print("profile updated!")
            case .failure(let error):
                print("Response Error: \(error.localizedDescription)")
            }
        })
    }
    
}
