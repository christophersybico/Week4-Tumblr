//
//  TabBarViewController.swift
//  Week4-Tumblr
//
//  Created by Sybico, Christopher on 10/6/15.
//  Copyright © 2015 Sybico, Christopher. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var tabbarButtons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    // CREATE DISCOVER BUBBLE
    @IBOutlet weak var discoverBubbleImageView: UIImageView!
    var discoverBubbleOY: CGFloat! = 446
    var discoverBubblePreviousY: CGFloat! = 446
    
    // LOADING IMAGES
    @IBOutlet weak var loaderImageView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    
    // CREATE COMPOSE VIEW
//    var composeView:UIView = UIView()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()

        // ACCESS MAIN STORYBOARD
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // INSTATIATE VIEW CONTROLLERS
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        // ADD EACH VIEW CONTROLLERS TO viewControllers ARRAY
        viewControllers = [
            homeViewController,
            searchViewController,
            accountViewController,
            trendingViewController
        ]
        
        tabbarButtons[selectedIndex].selected = true
        didPressTab(tabbarButtons[selectedIndex])
        
        // SET UP BUBBLE
        discoverBubbleImageView.alpha = 0
        
        // ADD LOADING IMAGES INTO THE images ARRAY
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-2")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        
        loaderImageView.image = animatedImage
        loaderImageView.alpha = 0
        
        // SET UP CONTENT VIEW
//        composeView.frame = view.bounds
//        composeView.backgroundColor = UIColorFromRGB(0x32465B)
//        composeView.alpha = 0.8
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        showBubble()
    }
    
    func showBubble() {

        
        discoverBubbleImageView.frame.origin.y = discoverBubbleOY
        
        UIView.animateWithDuration(
            1,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            
            animations: { () -> Void in
                self.discoverBubbleImageView.alpha = 1
            },
            
            completion: nil
        )
        
        
        delay(0.5) { () -> () in
            
            UIView.animateWithDuration(
                1,
                delay: 0,
                options: [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse],
                
                animations: { () -> Void in
                    self.discoverBubbleImageView.frame.origin.y += 8
                },
                
                completion: nil
            )
        }
    }
    
    
    
    // CONVERT HEX TO RGB
    // stackoverflow.com/questions/24074257/how-to-use-uicolorfromrgb-value-in-swift
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // HOME, SEARCH, ACCOUNT, TRENDING TABS
    @IBAction func didPressTab(sender: UIButton) {
        
        // REMOVE THE PREVIOUS VIEW CONTROLLER AND SET BUTTON STATE
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        tabbarButtons[previousIndex].selected = false
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        
        // ADD THE NEW VIEW CONTROLLER AND SET BUTTON STATE
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        
        if selectedIndex == 1 {
            
            UIView.animateWithDuration(
                1,
                delay: 0,
                options: UIViewAnimationOptions.CurveEaseIn,
                
                animations: { () -> Void in
                    self.discoverBubbleImageView.alpha = 0
                },
                
                completion: nil
            )
            
            // SHOW LOADER
            loaderImageView.alpha = 1
            
            delay(3, closure: { () -> () in
                
                self.addChildViewController(vc)
                vc.view.frame = self.contentView.bounds
                self.contentView.addSubview(vc.view)
                vc.didMoveToParentViewController(self)
                self.loaderImageView.alpha = 0

            })
            
        }
        
        else {
            showBubble()
            addChildViewController(vc)
            vc.view.frame = contentView.bounds
            contentView.addSubview(vc.view)
            vc.didMoveToParentViewController(self)
        
        }
        
//        print("hello")
        
    }
    
    @IBAction func didPressComposeTab(sender: UIButton) {
        
        performSegueWithIdentifier("composeSegue", sender: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
