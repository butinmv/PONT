//
//  BottomSuplentaryView.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit
import SnapKit

class BottomSupplementaryView: UICollectionReusableView {
    
    @objc
    private func tapLike() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: {
            self.countLike.isHidden.toggle()
            self.stackView.layoutIfNeeded()
        },
                       completion: nil)
    }
    
    private lazy var likeView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.addSubview(stackView)
        return view
    }()
    
    private var likeLabel: UILabel = {
        let label = UILabel()
        label.text = "🍻"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private var countLike: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "295"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeLabel, countLike])
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        likeView.layer.cornerRadius = likeView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addSubview(likeView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        
        likeView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLike))
        likeView.addGestureRecognizer(tapGesture)
    }
}
