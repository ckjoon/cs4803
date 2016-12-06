//
//  Treatment.swift
//  ducktab
//
//  Created by Nishant Panchal on 12/2/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import UIKit

class Treatment: UIViewController {

    var treatmentType:String!
    var usedApp:String!
    
    @IBOutlet weak var AppUsed: UILabel!
    @IBOutlet weak var treatText: UILabel!
    @IBOutlet weak var selectTreat1: UIImageView!
    @IBOutlet weak var selectTreat2: UIImageView!
    @IBOutlet weak var selectYesNo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Loading image resources and placing them at respective location
        
        selectTreat1.image = UIImage(named: "hemoncoSelect")
        selectTreat2.image = UIImage (named: "notSureSelect")
        selectYesNo.image = UIImage (named: "yesnoSelect")
        
        selectTreat1.frame.origin.x = 109
        selectTreat1.frame.origin.y = 509
        
        selectTreat2.frame.origin.x = 274
        selectTreat2.frame.origin.y = 789
        
        selectYesNo.frame.origin.x = 110
        selectYesNo.frame.origin.y = 815.5
        
        // Hiding the 'selected' images
        
        selectTreat1.hidden = true
        selectTreat2.hidden = true
        selectYesNo.hidden = true
        
        // Setting default values for treatment and app used
        
        treatmentType = "Not_Sure"
        usedApp = "No"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func noClicked(sender: AnyObject) {
        // When 'no' is clicked, unhide the 'selected' image and place it on 'No'
        
        selectYesNo.frame.origin.x = 229
        selectYesNo.frame.origin.y = 280
        selectYesNo.hidden = false
        usedApp = "No"
        AppUsed.text = usedApp
    }
    
    @IBAction func yesClicked(sender: AnyObject) {
        // When 'yes' is clicked, unhide the 'selected' image and place it on 'yes'
        
        selectYesNo.frame.origin.x = 401
        selectYesNo.frame.origin.y = 280
        selectYesNo.hidden = false
        usedApp = "Yes"
        AppUsed.text = usedApp
    }
    
    @IBAction func hemClicked(sender: AnyObject) {
        // When 'Hematology' is clicked, unhide the 'selected' image and place it on 'Hematology'
        
        selectTreat1.frame.origin.x = 109
        selectTreat1.frame.origin.y = 509
        selectTreat1.hidden = false
        selectTreat2.hidden = true
        treatmentType = "Hematology"
        treatText.text = treatmentType
    }
    
    @IBAction func oncoClicked(sender: AnyObject) {
        // When 'Oncology' is clicked, unhide the 'selected' image and place it on 'Oncology'
        
        selectTreat1.frame.origin.x = 405
        selectTreat1.frame.origin.y = 509
        selectTreat1.hidden = false
        selectTreat2.hidden = true
        treatmentType = "Oncology"
        treatText.text = treatmentType
    }
    
    @IBAction func notSureClicked(sender: AnyObject) {
            // When 'Not Sure' is clicked, unhide the 'selected' image and place it on 'Not Sure'
        
            selectTreat2.frame.origin.x = 110
            selectTreat2.frame.origin.y = 815.5
            selectTreat1.hidden = true
            selectTreat2.hidden = false
            treatmentType = "Not_Sure"
            treatText.text = treatmentType
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Navigate to Character screen by hitting 'Next'
        
        if (segue.identifier == "toCharacter") {
            if let svc = segue.destinationViewController as? Introduction{
                svc.treatmentType = treatmentType
                svc.usedApp = usedApp
            }
        }
    }
}
