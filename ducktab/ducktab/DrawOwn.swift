//
//  DrawOwn.swift
//  ducktab
//
//  Created by Yeon Joon Choi on 10/19/16.
//  Copyright © 2016 gatech.edu. All rights reserved.
//

import Foundation
import UIKit

class DrawOwn: UIViewController {
    
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var TempImageView: UIImageView!
    var currentImage: UIImage!
    
    var lastPoint = CGPoint.zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    let colors: [(CGFloat, CGFloat, CGFloat)] = [
        (0, 0, 0),
        (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0),
        (1.0, 0, 0),
        (0, 0, 1.0),
        (51.0 / 255.0, 204.0 / 255.0, 1.0),
        (102.0 / 255.0, 204.0 / 255.0, 0),
        (102.0 / 255.0, 1.0, 0),
        (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0),
        (1.0, 102.0 / 255.0, 0),
        (1.0, 1.0, 0),
        (1.0, 1.0, 1.0),
    ]
    @IBAction func reset(sender: AnyObject) {
        MainImageView.image=nil
    }
    
    @IBAction func pencilPressed(sender: AnyObject) {
        
        var index = sender.tag ?? 0
        if index < 0 || index >= colors.count {
            index = 0
        }
        
        (red, green, blue) = colors[index]
        
        if index == colors.count - 1 {
            opacity = 1.0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        TempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        // 2
        CGContextMoveToPoint(context!, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context!, toPoint.x, toPoint.y)
        
        // 3
        CGContextSetLineCap(context!, .Round)
        CGContextSetLineWidth(context!, brushWidth)
        CGContextSetRGBStrokeColor(context!, red, green, blue, 1.0)
        CGContextSetBlendMode(context!, .Normal)
        
        // 4
        CGContextStrokePath(context!)
        
        // 5
        TempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        TempImageView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped=false
        if let touch = touches.first as UITouch? {
            lastPoint = touch.locationInView(self.view)
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = true
        if let touch = touches.first as UITouch? {
            let currentPoint = touch.locationInView(view)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !swiped {
            // draw a single point
            drawLineFrom(lastPoint, toPoint: lastPoint)
        }
        
        // Merge tempImageView into mainImageView
        UIGraphicsBeginImageContext(MainImageView.frame.size)
        MainImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .Normal, alpha: 1.0)
        TempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .Normal, alpha: opacity)
        MainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        TempImageView.image = nil

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "fromDrawToGender") {
            if let svc = segue.destinationViewController as? Gender{
                UIGraphicsBeginImageContext(MainImageView.bounds.size)
                MainImageView.image?.drawInRect(CGRect(x: 0, y: 0,
                    width: MainImageView.frame.size.width, height: MainImageView.frame.size.height))
                let image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                svc.currentImage = image
            }
        }
        
    }

}
