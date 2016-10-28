//
//  GamePlayground.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/18/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation
import UIKit

class GamePlayground: UIViewController {
    
    var currentImage: UIImage!
    var currentGender: String!
    var currentAge:String!
    var currentURL: String!

    @IBOutlet weak var gameScreen: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: currentURL!)
        let requestObj = NSURLRequest(URL: url!);
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
            }
        }
        
    }


    
}
