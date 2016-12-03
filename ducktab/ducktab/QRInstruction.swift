//
//  QRInstruction.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/28/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation
import UIKit

class QRInstruction: UIViewController {
    var cImage: UIImage!
    var cGender: String!
    var cAge:String!
    var treatmentType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toQRCode") {
            if let svc = segue.destinationViewController as? QRcode{
                svc.currentImage = cImage
                svc.currentGender = cGender
                svc.currentAge = cAge
                svc.treatmentType = treatmentType
            }
        }
        
        if (segue.identifier == "backToAge") {
            if let svc = segue.destinationViewController as? Age{
                svc.currentImage = cImage
                svc.currentGender = cGender
                svc.treatmentType = treatmentType
            }
        }
        
        
    }


}
