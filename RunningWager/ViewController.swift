//
//  ViewController.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/5/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    

    @IBOutlet weak var Open: UIBarButtonItem!
    @IBOutlet weak var usernameInput: LoginTextField!
    @IBOutlet weak var passwordInput: LoginTextField!
    @IBOutlet weak var statusMsg: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
            
        try! FIRAuth.auth()?.signOut()
            
        Model.resetModel()
        
        
        
        
        
        
    }
    
    // When the login button is pushed
    @IBAction func loginButton(_ sender: LoginButton) {
        
        
        
        
        if let name = usernameInput.text {
            
            var numCharacters: Int = 0
            
            for _ in name.characters{
                numCharacters += 1
            }
            
            if numCharacters == 0 {
                statusMsg.text = "Please enter a valid username"
            } else {
                
                if let password = passwordInput.text {
                    
                    var numCharactersPassword: Int = 0
                    
                    for _ in password.characters {
                        numCharactersPassword += 1
                    }
                    
                    if numCharactersPassword != 0 {
                        
                        if (sender.titleLabel?.text == "LOGIN") {
                            FIRAuth.auth()?.signIn(withEmail: name, password: password) { (user, error) in
                                
                                if error != nil {
                                    
                                    if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                                        
                                        switch errCode {
                                        case .errorCodeInvalidEmail:
                                            self.statusMsg.text = ("invalid email")
                                        case .errorCodeEmailAlreadyInUse:
                                            self.statusMsg.text = ("in use")
                                        case .errorCodeWrongPassword:
                                            self.statusMsg.text = ("invalid password")
                                        default:
                                            print("Create User Error: \(error!)")
                                        }
                                    }
                                    
                                } else {
                                    self.statusMsg.text = ("all good... continue")
                                    
                                    Model.user = user
                                    Model.userID = user!.uid
                                    Model.dbRef = FIRDatabase.database().reference().child(Model.userID)
                                    self.performSegue(withIdentifier: "nextView", sender: nil)
                                }
                                
                            }
                            
                        } else {
                            
                            FIRAuth.auth()?.createUser(withEmail: name, password: password) { (user, error) in
                                
                            }
                            
                            statusMsg.text = "bob eat bob world"
                            
                            FIRAuth.auth()?.signIn(withEmail: name, password: password, completion: nil)
                        }
                        
                        
                
                    } else {
                        statusMsg.text = "Please enter a password"
                    }
                } else {
                    statusMsg.text = "Please enter a password"
                }
                
                
            }
            
            
            
            
        } else {
            statusMsg.text = "Please enter a valid username"
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

