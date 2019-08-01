//
//  ProfileViewController.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/1/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ProfileViewController: UIViewController {
    
    var loginResponse: LoginResponse? {
        didSet{
            print("set: \(String(describing: loginResponse?.user.id))")
        }
    }

    
    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var scheduleLabel: UILabel!
    
    override func viewDidLoad() {
        getProfile()
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
        
    }
    
    
    func getProfile(){
        let parameters = [ "username" : "veterinary", "password" : "123"]
        Alamofire.AF.request(PetHealthApi.userLogin, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate()
            .responseJSON(completionHandler: { response in
                switch response.result{
                case .success(let value):
                    print("Funcionó x2")
                    let json = JSON(value)
                    print(json)
                    self.loginResponse = LoginResponse.init(jsonLoginResponse: json["data"])

                    
                case .failure(let error):
                    print("Aquí vamos de nuevo")
                    print("Response Error: \(error.localizedDescription)")
                }
                
            })
    }
    
    func updateData(){
        if let loginResponse = loginResponse {
            nameLabel.text = loginResponse.veterinary.name
            phoneLabel.text = loginResponse.veterinary.phone
            addressLabel.text = loginResponse.veterinary.location
            scheduleLabel.text = loginResponse.veterinary.opening_hours
            if let url = URL(string: loginResponse.user.photo){
                pictureImageView.af_setImage(withURL: url)
            }
        }
    }
}
