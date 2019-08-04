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
    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var scheduleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
        
    }
    
    func updateData(){
        nameLabel.text = veterinary.name
        phoneLabel.text = veterinary.phone
        addressLabel.text = veterinary.location
        scheduleLabel.text = veterinary.opening_hours
        if let url = URL(string: repository.userPhoto!){
            pictureImageView.af_setImage(withURL: url)
        }
    }
}

