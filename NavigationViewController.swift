//
//  NavigationViewController.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/6/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NavigationViewController: UIViewController {

    
    @IBOutlet weak var username: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setName()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setName() {
        var newUsername: String = ""
        
        Model.dbRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            newUsername += value?["name"] as? String ?? "fook u"
            
            self.username.setTitle(newUsername, for: UIControlState.normal)
            
            Model.name = newUsername
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
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
