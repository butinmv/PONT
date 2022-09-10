//
//  HeaderSupplementaryView.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit
import SnapKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    var person: Person! {
        didSet {
            avatarImageView.image = person.avatar
            nameLabel.text = person.name
            sirnameLabel.text = person.sirname
            timeLabel.text = "00:43"
        }
    }
    
    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var sirnameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderSupplementaryView {
    
    private func configure() {
        
    }
}
