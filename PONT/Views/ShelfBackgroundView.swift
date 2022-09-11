//
//  ShelfBackgroundView.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit

public class ShelfBackgroundView: UICollectionReusableView {
    
    private enum Layout {
        static let cornerRadius: CGFloat = 24
    }
    
    public var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = Layout.cornerRadius
    }
}

