//
//  PUILikeView.swift
//  PONT
//
//  Created by Maxim Butin on 24.09.2022.
//

import UIKit
import SnapKit

public class PUILikeView: View {
    
    private enum Constants {
        static var insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    var countLike = 0
    private var defaultEmoji: String
    private var likeEmoji: String
    private var defaultBackgroundColor: UIColor
    private var likeBackgroundColor: UIColor
    
    private var likeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private var countLikeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.isHidden = true
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeLabel, countLikeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    init(defaultEmoji: String, likeEmoji: String, defaultBackgroundColor: UIColor, likeBackgroundColor: UIColor) {
        self.defaultEmoji = defaultEmoji
        self.likeEmoji = likeEmoji
        self.defaultBackgroundColor = defaultBackgroundColor
        self.likeBackgroundColor = likeBackgroundColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func configure() {
        addSubview(stackView)
        
        checkCountLike()
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.insets)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLike))
        addGestureRecognizer(tapGesture)
    }
    
    private func checkCountLike() {
        let flag = countLike == 0
        backgroundColor = flag ? defaultBackgroundColor : likeBackgroundColor
        likeLabel.text = flag ? defaultEmoji : likeEmoji
        countLikeLabel.isHidden = flag
        countLikeLabel.text = "\(countLike)"
    }
    
    @objc
    private func tapLike() {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: [], animations: {
            [weak self] in
            
            self?.countLike += 1
            self?.checkCountLike()
            self?.stackView.layoutIfNeeded()
        })
    }
}
