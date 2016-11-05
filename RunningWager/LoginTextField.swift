//
//  LoginTextField.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/5/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.layer.borderColor = UIColor( red: 255/255, green: 153/255, blue:71/255, alpha: 1.0 ).cgColor
        
        self.layer.borderWidth = 1
        
        self.layer.cornerRadius = 9
        
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

}
