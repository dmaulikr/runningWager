//
//  GenericViewController.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/24/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import Foundation

class GenergicViewController : UIViewController {
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
