//
//  Model.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/5/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class Model {
    
    //Class variables
    static var username: String = ""
    static var password: String = ""
    static var user: FIRUser? = nil
    static var userID: String = ""
    static var dbRef: FIRDatabaseReference = FIRDatabase.database().reference()
    static var name: String = ""
    
    init () {
        
    }
    
    
    
    func setUsername(name: String){
        Model.username = name
    }
    
    func getUsername() -> String {
        return Model.username
    }
    
    
    
}
