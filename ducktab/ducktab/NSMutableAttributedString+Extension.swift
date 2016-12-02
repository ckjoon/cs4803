//
//  NSMutableAttributedString+Extension.swift
//  ducktab
//
//  Created by Nishant Panchal on 12/2/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation

//For bold and normal string
extension NSMutableAttributedString {
    func bold(text:String) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont(name: "AvenirNext-Medium", size: 12)!]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.appendAttributedString(boldString)
        return self
    }
    
    func normal(text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.appendAttributedString(normal)
        return self
    }
}
