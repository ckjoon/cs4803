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
    @IBOutlet weak var gen: UILabel!
    
    @IBOutlet weak var cImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cImage.image = currentImage
        gen.text = "BOY"
        if((genderText) != ""){
            gen.text=genderText
        }
    }
    
    @IBAction func boyClicked(sender: AnyObject) {
        gen.text = "BOY"
    }

    @IBAction func girlClicked(sender: AnyObject) {
        gen.text = "GIRL"
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toAge") {
            if let svc = segue.destinationViewController as? Age{
                svc.currentImage = currentImage
                svc.currentGender = gen.text
            }
        }
        if (segue.identifier == "toIntroduction") {
            if let svc = segue.destinationViewController as? Introduction{
                svc.cImage = currentImage
                
            }
        }
        
    }
    
}
