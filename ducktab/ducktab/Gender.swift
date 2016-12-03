//
//  Gender.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/17/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class Gender: UIViewController {
    
    var currentImage: UIImage!
    var genderText:String!
    var treatmentType:String!
    var usedApp:String!
    
    @IBOutlet weak var gen: UILabel!
    @IBOutlet weak var treat: UILabel!
    @IBOutlet weak var cImage: UIImageView!
    @IBOutlet weak var selectedGender: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cImage.image = currentImage
        gen.text = "BOY"
        if((genderText) != ""){
            gen.text=genderText
        }
        treat.text = treatmentType
        
        selectedGender.hidden = true
        selectedGender.image = UIImage(named: "genderSelect")
    }
    
    @IBAction func boyClicked(sender: AnyObject) {
        gen.text = "BOY"
        selectedGender.hidden = false
        selectedGender.frame.origin.x = 70
        selectedGender.frame.origin.y = 567
    }

    @IBAction func girlClicked(sender: AnyObject) {
        gen.text = "GIRL"
        selectedGender.hidden = false
        selectedGender.frame.origin.x = 407
        selectedGender.frame.origin.y = 567
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toAge") {
            if let svc = segue.destinationViewController as? Age{
                svc.currentImage = currentImage
                svc.currentGender = gen.text
                svc.treatmentType = treatmentType
                svc.usedApp = usedApp
            }
        }
        if (segue.identifier == "toIntroduction") {
            if let svc = segue.destinationViewController as? Introduction{
                svc.cImage = currentImage
                svc.treatmentType = treatmentType
                svc.usedApp = usedApp
            }
        }
        
    }
    
}
