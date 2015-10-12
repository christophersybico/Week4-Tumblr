//
//  TrendingViewController.swift
//  Week4-Tumblr
//
//  Created by Sybico, Christopher on 10/10/15.
//  Copyright © 2015 Sybico, Christopher. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var trendingScrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // TRENDING SCROLL VIEW
        trendingScrollView.contentSize = CGSize(
            width: 320,
            height: 1217
        )

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
