//
//  ViewController.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/5/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var Open: UIBarButtonItem!
    @IBOutlet weak var usernameInput: LoginTextField!
    @IBOutlet weak var passwordInput: LoginTextField!
    
    // When the login button is pushed
    @IBAction func loginButton(_ sender: LoginButton) {
        
        if let name = usernameInput.text {
            Model.username = name
            
        } else {
            Model.username = "this shouldn't be here"
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround()
        
        // For the view ViewController
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// Hides the keyboard when the user taps outside of its area
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

