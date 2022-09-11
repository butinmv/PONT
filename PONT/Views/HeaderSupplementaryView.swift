//
//  HeaderSupplementaryView.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit
import SnapKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    private enum Layout {
        static var cornerRadius: CGFloat = 16
        static var avatarSize = CGSize(width: 85, height: 85)
        static var verticalOffset: CGFloat = 16
        static var spcaingBetweenComponent: CGFloat = 8
    }
    
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
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var sirnameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var nameAndSirnameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, sirnameLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = Layout.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addSubview(avatarImageView)
        addSubview(nameAndSirnameStackView)
        addSubview(timeLabel)
        
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(Layout.avatarSize)
            $0.top.equalToSuperview().offset(Layout.verticalOffset)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-Layout.verticalOffset)
            $0.trailing.equalTo(nameAndSirnameStackView.snp.leading).inset(Layout.spcaingBetweenComponent)
            $0.trailing.equalTo(timeLabel.snp.leading).inset(Layout.spcaingBetweenComponent)
        }
        
        nameAndSirnameStackView.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.top)
            $0.trailing.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints {
            $0.bottom.equalTo(avatarImageView.snp.bottom)
            $0.trailing.equalToSuperview()
        }
    }
}
