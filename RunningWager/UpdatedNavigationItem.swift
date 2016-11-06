//
//  UpdatedNavigationItem.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/6/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit

@IBDesignable
class UpdatedNavigationItem: UINavigationBar {
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        
        // self.titleTextAttributes[]
    }
    
}
