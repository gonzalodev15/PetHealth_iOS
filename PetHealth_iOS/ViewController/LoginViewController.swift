//
//  LoginViewController.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 8/2/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

let repository : PetHealthRepository! = PetHealthRepository()
var veterinary : Veterinary!

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    
    
    var loginResponse : LoginResponse!

    @IBAction func loginAction(_ sender: UIButton) {
        authenticateUser()
        run(after: 2){
                self.executeSegue()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func run(after seconds: Int, completion: @escaping () -> Void) {
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            completion()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func executeSegue(){
        self.performSegue(withIdentifier: "showContent", sender: self)
    }
    
    func authenticateUser(){
        print(usernameTextBox.text!)
        print(passwordTextBox.text!)
        
        let parameters = ["username" :  "\(usernameTextBox.text!)", "password" : "\(passwordTextBox.text!)"]
        Alamofire.AF.request(PetHealthApi.userLogin, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                self.loginResponse = LoginResponse.init(jsonLoginResponse: json["data"])
                repository.accessTokenAuthentication = self.loginResponse.accessToken
                repository.userId = self.loginResponse.user.id
                repository.userPhoto = self.loginResponse.user.photo
                repository.userMail = self.loginResponse.user.mail
                veterinary = self.loginResponse.veterinary
                
            case .failure(let error):
                print("Response Error: \(error.localizedDescription)")
            }
        })
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
