//
//  ShelfCollectionViewCell.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit
import SnapKit

class AlcoholCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    var alcohol: Alcohol! {
        didSet {
            imageView.image = alcohol.image
            titleLabel.text = alcohol.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlcoholCollectionViewCell {
    
    private func configure() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.8)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
