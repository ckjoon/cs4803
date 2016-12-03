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
    var currentLocation:String!
    var treatmentType:String!
    
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var answer4: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer5: UITextField!
    @IBOutlet weak var answer1: UITextField!
    private var answers: [UITextField] = []
    private var labels: [UILabel] = []
    @IBOutlet weak var question5: UILabel!
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question3: UILabel!
    let UUIDValue = UIDevice.currentDevice().identifierForVendor!.UUIDString //unique identifier for the device

    @IBOutlet weak var currentImage: UIImageView!
    let rootRef = FIRDatabase.database().reference() //root

    
    override func viewWillAppear(animated: Bool) {

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image=cImage
        let surveys = rootRef.child("questions").child(currentLocation)
        labels.append(question1)
        labels.append(question2)
        labels.append(question3)
        labels.append(question4)
        labels.append(question5)
        
        answers.append(answer1)
        answers.append(answer2)
        answers.append(answer3)
        answers.append(answer4)
        answers.append(answer5)
        
        surveys.observeSingleEventOfType(.Value, withBlock:  {snapshot in
            var i = 0;
            for child in snapshot.children{
                self.labels[i].text = child.key! as String
                self.answers[i].hidden = false;
                i++
            }
        })
    }
    
    

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "backToInst") {
            var i = 0;
            while i < 5{
                if (((labels[i].text?.isEmpty)) == false){
                    let putAnswer = rootRef.child("questions").child(currentLocation).child(labels[i].text!)
                    let key = putAnswer.childByAutoId().key
                    let post = ["age": cAge,
                                "gender":cGender,
                                "answer": answers[i].text]
                    let childUpdates = ["\(key)":post]
                    putAnswer.updateChildValues(childUpdates)
                }
                i = i+1;
            }
            let node = rootRef.child("current_location").child(currentLocation);
            let query = rootRef.child("current_location").child(currentLocation).queryOrderedByValue().queryEqualToValue(UUIDValue)
            query.observeSingleEventOfType(.Value, withBlock: { snapshot in
                for child in snapshot.children {
                    self.currentLocation = (child.key!)
                    node.child(child.key! as String).removeValue()
                }
            })
            if let svc = segue.destinationViewController as? QRInstruction{
                svc.cImage = cImage
                svc.cGender = cGender
                svc.cAge = cAge
                svc.treatmentType = treatmentType
            }
        }
    }
}
