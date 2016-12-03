//
//  GamePlayground.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/18/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

class GamePlayground: UIViewController {
    
    var currentImage: UIImage!
    var currentGender: String!
    var currentAge:String!
    var currentURL: String!
    var treatmentType:String!
    
    var currentLocation: String!{
        didSet{
            let key = rootRef.child("current_location").childByAutoId().key
            let childUpdates = ["\(key)":UUIDValue]
            rootRef.child("current_location").child(currentLocation!).updateChildValues(childUpdates);
        }
    }
    let rootRef = FIRDatabase.database().reference() //root
    @IBOutlet weak var gameScreen: UIWebView!
    let UUIDValue = UIDevice.currentDevice().identifierForVendor!.UUIDString //unique identifier for the device

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (currentURL)
        let query = rootRef.child("qrcode").queryOrderedByValue().queryEqualToValue(currentURL)

        query.observeSingleEventOfType(.Value, withBlock: { snapshot in
            for child in snapshot.children {
                self.currentLocation = (child.key!)
            }
        })
        
        
        
      
/*

*/
            /*
        print (a)
        qrcodeRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
                for (_,qr) in allQR {
                    print(qr);
                    if(qr.isEqualToString(self.currentURL)){
                        
                    }
                }
            }            
            }
        
        )
        */
        
        let url = NSURL(string: currentURL!)
        let requestObj = NSURLRequest(URL: url!)
        gameScreen.loadRequest(requestObj)
        self.view.addSubview(gameScreen)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toSurvey") {
            if let svc = segue.destinationViewController as? Survey{
                svc.cImage = currentImage
                svc.cGender = currentGender
                svc.cAge = currentAge
                svc.treatmentType = treatmentType
                svc.currentLocation = currentLocation
            }
        }
        
    }


    
}
