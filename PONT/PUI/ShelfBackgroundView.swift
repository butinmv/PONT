//
//  ShelfBackgroundView.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit

public class ShelfBackgroundView: CollectionReusableView {
    
    private enum Layout {
        static let cornerRadius: CGFloat = 24
    }
    
    public var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    public override func configure() {
        addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = Layout.cornerRadius
    }
}

