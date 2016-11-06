//
//  Model.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/5/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import Foundation

class Model {
    
    //Class variables
    static var username: String = "";
    static var password: String = "";
    
    func setUsername(name: String){
        Model.username = name
    }
    
    func getUsername() -> String {
        return Model.username
    }
}
