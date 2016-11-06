//
//  LoginButton.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/5/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit

@IBDesignable
class LoginButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor( red: 255/255, green: 153/255, blue:71/255, alpha: 1.0 ).cgColor
        
        self.layer.borderWidth = 1
        
        self.layer.cornerRadius = 9
    }

}
