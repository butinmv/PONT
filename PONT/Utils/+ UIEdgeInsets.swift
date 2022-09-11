//
//  + UIEdgeInsets.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit

public extension UIEdgeInsets {
    
    init(horizontal: CGFloat) {
        self.init(top: 0, left: horizontal, bottom: 0, right: horizontal)
    }
    
    init(top: CGFloat, horizontal: CGFloat) {
        self.init(top: top, left: horizontal, bottom: 0, right: horizontal)
    }
    
    init(bottom: CGFloat, horizontal: CGFloat) {
        self.init(top: 0, left: horizontal, bottom: bottom, right: horizontal)
    }
    
    init(vertical: CGFloat) {
        self.init(top: vertical, left: 0, bottom: vertical, right: 0)
    }
    
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
