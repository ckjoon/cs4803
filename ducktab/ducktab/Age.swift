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
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var cImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cImage.image=currentImage
        gender.text=currentGender
    }
    
    
    @IBAction func threeClicked(sender: AnyObject) {
        age.text = "3"
        currentAge = "3~6";
    }
    
    @IBAction func fourClicked(sender: AnyObject) {
        age.text = "4"
        currentAge = "3~6";
    }
    
    @IBAction func fiveClicked(sender: AnyObject) {
        age.text = "5"
        currentAge = "3~6";
    }
    
    @IBAction func sixClicked(sender: AnyObject) {
        age.text = "6"
        currentAge = "3~6";
    }
    
    @IBAction func sevenClicked(sender: AnyObject) {
        age.text = "7"
        currentAge = "7~10";
    }
    
    @IBAction func eightClicked(sender: AnyObject) {
        age.text = "8"
        currentAge = "7~10";

    }
    
    @IBAction func nineClicked(sender: AnyObject) {
        age.text = "9"
        currentAge = "7~10";

    }
    
    @IBAction func tenClicked(sender: AnyObject) {
        age.text = "10"
        currentAge = "7~10";

    }
    
    @IBAction func elevenClicked(sender: AnyObject) {
        age.text = "11~15"
        currentAge = "11~15";

    }
    
    @IBAction func sixteenClicked(sender: AnyObject) {
        age.text = "16~20"
        currentAge = "16~20";
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toSurvey") {
            if let svc = segue.destinationViewController as? Survey{
                svc.cImage = currentImage
                svc.cGender = currentGender
                svc.cAge = currentAge
            }
        }
        
    }

    
    
}
