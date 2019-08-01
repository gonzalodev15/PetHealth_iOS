//
//  AppointmentViewController.swift
//  PetHealth_iOS
//
//  Created by Gonzalo Leon Suarez on 7/31/19.
//  Copyright © 2019 PetHealth. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"

class AppointmentCell: UICollectionViewCell{
    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    func updateViews(from appointmentResponse: AppointmentResponse){
        nameLabel.text = appointmentResponse.pet.name
        dateLabel.text = appointmentResponse.appointment.appt_date
        if let url = URL(string: appointmentResponse.pet.image_url){
            pictureImageView.af_setImage(withURL: url)
        }
    }
}
class AppointmentViewController: UICollectionViewController {

    var appointmentResponses: [AppointmentResponse] = []
    var currentAppointment: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        updateData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return appointmentResponses.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppointmentCell
    
        // Configure the cell
        cell.updateViews(from: appointmentResponses[indexPath.row])
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
 */
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentAppointment = indexPath.row
        self.performSegue(withIdentifier: "showAppointmentDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAppointmentDetail" {
            let eventController = (segue.destination as! UINavigationController).viewControllers.first as! AppointmentDetailViewController
            eventController.appointmentResponse = appointmentResponses[currentAppointment]
        }
        return
    }
 
    func updateData(){
        let headers: HTTPHeaders = ["access_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTU2NDI4MTM2NX0.dULXZalKh5B8NRGsscdPv2oB9WScczzOTaAX-KaNMXY"]
        Alamofire.AF.request(PetHealthApi.appointmentsUrl(userid: 27), headers: headers).validate()
            .responseJSON(completionHandler: { response in
                switch response.result{
                case .success(let value):
                    print("Funcionó!")
                    let json = JSON(value)
                    self.appointmentResponses = AppointmentResponse.buildAll(from: json["data"].arrayValue)
                    self.collectionView!.reloadData()
                case .failure(let error):
                    print("Asu, falló :'v")
                    print("Request: \(String(describing: response.request))") 
                    print("Response Error: \(error.localizedDescription)")
                }
                
            })
    }

}
