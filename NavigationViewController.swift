//
//  NavigationViewController.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/6/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    
    @IBOutlet weak var username: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        username.setTitle(Model.username.capitalized, for: UIControlState.normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
