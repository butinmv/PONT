//
//  PUISupplementaryView.swift
//  PONT
//
//  Created by Maxim Butin on 24.09.2022.
//

import UIKit

public class SupplementaryView: UICollectionReusableView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() { }
}
