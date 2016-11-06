//
//  ViewController.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/5/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    @IBOutlet weak var usernameInput: LoginTextField!
    @IBOutlet weak var passwordInput: LoginTextField!
    
    // When the login button is pushed
    @IBAction func loginButton(_ sender: LoginButton) {
        
        model.name = usernameInput.text!
        
        performSegue(withIdentifier: "toGoals", sender: self)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround()
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

