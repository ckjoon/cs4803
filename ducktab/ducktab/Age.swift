//
//  Age.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/18/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Age: UIViewController {
    
    var currentImage: UIImage!
    var currentGender: String!
    var currentAge:String!
    var treatmentType:String!
    var usedApp:String!
    
    
    @IBOutlet weak var selectAge1: UIImageView!
    @IBOutlet weak var selectAge2: UIImageView!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var cImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cImage.image=currentImage
        gender.text=currentGender
        selectAge1.hidden = true
        selectAge1.image = UIImage(named: "ageSelect")
        selectAge2.hidden = true
        selectAge2.image = UIImage(named: "ageSelect2")
    }
    
    
    @IBAction func threeClicked(sender: AnyObject) {
        age.text = "3"
        currentAge = "3~6";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 81
        selectAge1.frame.origin.y = 539
        selectAge1.hidden = false
    }
    
    @IBAction func fourClicked(sender: AnyObject) {
        age.text = "4"
        currentAge = "3~6";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 255
        selectAge1.frame.origin.y = 539
        selectAge1.hidden = false
    }
    
    @IBAction func fiveClicked(sender: AnyObject) {
        age.text = "5"
        currentAge = "3~6";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 428
        selectAge1.frame.origin.y = 539
        selectAge1.hidden = false
    }
    
    @IBAction func sixClicked(sender: AnyObject) {
        age.text = "6"
        currentAge = "3~6";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 588
        selectAge1.frame.origin.y = 539
        selectAge1.hidden = false
    }
    
    @IBAction func sevenClicked(sender: AnyObject) {
        age.text = "7"
        currentAge = "7~10";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 81
        selectAge1.frame.origin.y = 672
        selectAge1.hidden = false
    }
    
    @IBAction func eightClicked(sender: AnyObject) {
        age.text = "8"
        currentAge = "7~10";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 255
        selectAge1.frame.origin.y = 672
        selectAge1.hidden = false
    }
    
    @IBAction func nineClicked(sender: AnyObject) {
        age.text = "9"
        currentAge = "7~10";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 428
        selectAge1.frame.origin.y = 672
        selectAge1.hidden = false
    }
    
    @IBAction func tenClicked(sender: AnyObject) {
        age.text = "10"
        currentAge = "7~10";
        selectAge2.hidden = true
        selectAge1.frame.origin.x = 588
        selectAge1.frame.origin.y = 672
        selectAge1.hidden = false
    }
    
    @IBAction func elevenClicked(sender: AnyObject) {
        age.text = "11~15"
        currentAge = "11~15";
        selectAge1.hidden = true
        selectAge2.frame.origin.x = 81
        selectAge2.frame.origin.y = 790
        selectAge2.hidden = false
    }
    
    @IBAction func sixteenClicked(sender: AnyObject) {
        age.text = "16~20"
        currentAge = "16~20";
        selectAge1.hidden = true
        selectAge2.frame.origin.x = 428
        selectAge2.frame.origin.y = 790
        selectAge2.hidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toInst") {
            if let svc = segue.destinationViewController as? QRInstruction{
                svc.cImage = currentImage
                svc.cGender = currentGender
                svc.cAge = currentAge
                svc.treatmentType = treatmentType
                svc.usedApp = usedApp
            }
        }
        
        if (segue.identifier == "backToAge") {
            if let svc = segue.destinationViewController as? Gender{
                svc.currentImage = currentImage
                svc.genderText = currentGender
                svc.treatmentType = treatmentType
                svc.usedApp = usedApp
            }
        }

        
    }

    
    
}
