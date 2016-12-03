//
//  Treatment.swift
//  ducktab
//
//  Created by Nishant Panchal on 12/2/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Treatment: UIViewController {
    
    var treatmentType:String!
    @IBOutlet weak var selectTreatment: UIImageView!
    @IBOutlet weak var selectTreatment2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectTreatment.hidden = true
        selectTreatment2.hidden = true
    }

    @IBAction func hemClicked(sender: AnyObject) {
        selectTreatment.frame.origin.x = 109
        selectTreatment.frame.origin.y = 509
        selectTreatment.hidden = false
        selectTreatment2.hidden = true
        
        // set data for firebase
        treatmentType = "Hematology"
    }
    
    @IBAction func oncoClicked(sender: AnyObject) {
        selectTreatment.frame.origin.x = 405
        selectTreatment.frame.origin.y = 509
        selectTreatment.hidden = false
        selectTreatment2.hidden = true
        
        // set data for firebase
        treatmentType = "Oncology"
    }
    
    @IBAction func notSureClicked(sender: AnyObject) {
        selectTreatment2.frame.origin.x = 110
        selectTreatment2.frame.origin.y = 815.5
        selectTreatment2.hidden = false
        selectTreatment.hidden = true
        
        // set data for firebase
        treatmentType = "Not_Sure"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toCharacter"){
              //Send Data for Firebase
            if let svc = segue.destinationViewController as? Introduction{
                svc.treatmentType = treatmentType
            }
        }
    }
}

