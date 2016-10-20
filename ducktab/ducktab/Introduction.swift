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
    @IBOutlet weak var currentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func meowthClicked(sender: UIButton) {
        currentImage.image = UIImage(named:"meowth_icon")
    }

    @IBAction func snorlaxClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"snorlax_icon")
    }
    
    @IBAction func charmandarClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"charmander_icon")
    }
    
    
    @IBAction func caterpieClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"caterpie_icon")
    }
    
    @IBAction func dratiniClicked(sender: AnyObject) {
        currentImage.image = UIImage(named:"dratini_icon")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toGender") {
            if let svc = segue.destinationViewController as? Gender{
                svc.currentImage = currentImage.image

            }
        }

    }
    
    

}

