//
//  ShelfCollectionViewCell.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit
import SnapKit

public class AlcoholCollectionViewCell: CollectionViewCell {
    
    private enum Constants {
        static var cornerRadius: CGFloat = 10
        static var insets: CGFloat = 4
    }
    
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
    
    public override func configure() {
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.8)
            $0.top.equalToSuperview().inset(Constants.insets)
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = Constants.cornerRadius
    }
}
