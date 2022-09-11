//
//  + NSDirectionalEdgeInsets.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit

public extension NSDirectionalEdgeInsets {
    
    init(value: CGFloat) {
        self.init(top: value, leading: value, bottom: value, trailing: value)
    }
    
    init(horizontal: CGFloat) {
        self.init(top: 0, leading: horizontal, bottom: 0, trailing: horizontal)
    }
    
    init(top: CGFloat, horizontal: CGFloat) {
        self.init(top: top, leading: horizontal, bottom: 0, trailing: horizontal)
    }
    
    init(bottom: CGFloat, horizontal: CGFloat) {
        self.init(top: 0, leading: horizontal, bottom: bottom, trailing: horizontal)
    }
    
    init(vertical: CGFloat) {
        self.init(top: vertical, leading: 0, bottom: vertical, trailing: 0)
    }
    
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
}
