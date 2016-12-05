//
//  ViewController.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/17/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import UIKit
import Firebase

class Introduction: UIViewController {
    
    var cImage:UIImage!
    var treatmentType:String!
    var usedApp:String!
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var selectedChar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set and hide the 'selected' image
        selectedChar.hidden = true
        selectedChar.image = UIImage(named: "charSelect")
        
        currentImage.image = UIImage(named:"meowth_icon")
        if((cImage) != nil){
            currentImage.image=cImage
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Select respective character and it will present the selected image
    
    @IBAction func meowthClicked(sender: UIButton) {
        currentImage.image = UIImage(named:"meowth_icon")
        selectedChar.frame.origin.x = 74
        selectedChar.frame.origin.y = 542
        selectedChar.hidden = false
    }

    @IBAction func snorlaxClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"snorlax_icon")
        selectedChar.frame.origin.x = 294
        selectedChar.frame.origin.y = 542
        selectedChar.hidden = false
    }
    
    @IBAction func charmandarClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"charmander_icon")
        
        selectedChar.frame.origin.x = 514
        selectedChar.frame.origin.y = 542
        selectedChar.hidden = false
    }
    
    
    @IBAction func caterpieClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"caterpie_icon")
        
        selectedChar.frame.origin.x = 74
        selectedChar.frame.origin.y = 735
        selectedChar.hidden = false
    }
    
    @IBAction func dratiniClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"dratini_icon")
        
        selectedChar.frame.origin.x = 294
        selectedChar.frame.origin.y = 735
        selectedChar.hidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Navigate to gender selection by hitting 'Next' 
        if (segue.identifier == "toGender") {
            if let svc = segue.destinationViewController as? Gender{
                svc.currentImage = currentImage.image
                svc.treatmentType = treatmentType
                svc.usedApp = usedApp
            }
        }

    }
    
}

