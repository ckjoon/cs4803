//
//  Survey.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/18/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Survey: UIViewController {
    
    var cImage: UIImage!
    var cGender: String!
    var cAge:String!
    @IBOutlet weak var question1Answer: UITextField!
    
    @IBOutlet weak var question5: UILabel!
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question1: UILabel!
    let UUIDValue = UIDevice.currentDevice().identifierForVendor!.UUIDString //unique identifier for the device

    @IBOutlet weak var currentImage: UIImageView!
    let rootRef = FIRDatabase.database().reference() //root

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image=cImage

        let surveys = rootRef.child("survey questions")


        surveys.child("question1").child("subject").observeEventType(.Value) {(snap: FIRDataSnapshot) in
            self.question1.text = snap.value?.description;
        }
    }
    @IBAction func question1Submitted(sender: AnyObject) {
        let surveys = rootRef.child("survey questions")

        let key = surveys.childByAutoId().key
        let post = ["uuid": UUIDValue,
                    "age": cAge,
                    "gender":cGender,
                    "answer": question1Answer.text]
        let childUpdates = ["\(key)":post]
        surveys.child("question1").child("result").updateChildValues(childUpdates);
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toQRcode") {
            if let svc = segue.destinationViewController as? QRcode{
                svc.currentImage = cImage
                svc.currentGender = cGender
                svc.currentAge = cAge;
            }
        }
        
    }
    
    

}