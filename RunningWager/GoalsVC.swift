//
//  GoalsVC.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/15/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import Foundation

class GoalsVC: UIViewController {
    
    @IBOutlet weak var Open: UIBarButtonItem!
    //@IBOutlet weak var Open: UIBarButtonItem!
    override func viewDidLoad() {
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
