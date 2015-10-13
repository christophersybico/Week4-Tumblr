//
//  ComposeViewController.swift
//  Week4-Tumblr
//
//  Created by Sybico, Christopher on 10/10/15.
//  Copyright © 2015 Sybico, Christopher. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var neverMindButton: UIButton!
    
    var textButtonOY: CGFloat = 0.0
    var photoButtonOY: CGFloat = 0.0
    var quoteButtonOY: CGFloat = 0.0
    var linkButtonOY: CGFloat = 0.0
    var chatButtonOY: CGFloat = 0.0
    var videoButtonOY: CGFloat = 0.0
    var neverMindButtonOY: CGFloat = 0.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        textButtonOY = textButton.frame.origin.y
        photoButtonOY = photoButton.frame.origin.y
        quoteButtonOY = quoteButton.frame.origin.y
        linkButtonOY = linkButton.frame.origin.y
        chatButtonOY = chatButton.frame.origin.y
        videoButtonOY = videoButton.frame.origin.y
        neverMindButtonOY = neverMindButton.frame.origin.y
        
        
        textButton.frame.origin.y = 567
        photoButton.frame.origin.y = 567
        quoteButton.frame.origin.y = 567
        linkButton.frame.origin.y = 567
        chatButton.frame.origin.y = 567
        videoButton.frame.origin.y = 567
        neverMindButton.frame.origin.y = 567
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let composeButtons = [
            photoButton,
            textButton,
            quoteButton,
            linkButton,
            chatButton,
            videoButton,
            neverMindButton
        ]
        
        let OY = [
            textButtonOY,
            photoButtonOY,
            quoteButtonOY,
            linkButtonOY,
            chatButtonOY,
            videoButtonOY,
            neverMindButtonOY
        ]
        
        var buttonDelay = 0.0
        var OYIndex = 0
        
        for buttons in composeButtons {
            
            UIView.animateWithDuration(
                
                0.3,
                delay: buttonDelay,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0.1,
                options: UIViewAnimationOptions.CurveEaseIn,
                
                animations: { () -> Void in
                    buttons.frame.origin.y = OY[OYIndex]
                    buttons.alpha = 1
                },
                
                completion: nil
            
            )
            
            buttonDelay += 0.07
            OYIndex += 1
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
   
    @IBAction func didPressNevermind(sender: AnyObject) {
        
        let composeButtons = [
            neverMindButton,
            videoButton,
            textButton,
            photoButton,
            quoteButton,
            linkButton,
            chatButton,
        ]
        
        var buttonDelay = 0.0
        
        for buttons in composeButtons {
            
            UIView.animateWithDuration(
                
                0.3,
                delay: buttonDelay,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0.1,
                options: UIViewAnimationOptions.CurveEaseIn,
                
                animations: { () -> Void in
                    buttons.frame.origin.y = 567
                    buttons.alpha = 0
                },

                completion: nil
                
            )
            
            buttonDelay += 0.07
            
        }
        
        
        delay(0.4) { () -> () in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
