//
//  BottomSuplentaryView.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit
import SnapKit

class BottomSupplementaryView: CollectionReusableView {
    
    private var beerLikeView = PUILikeView(defaultEmoji: "🍺", likeEmoji: "🍻", defaultBackgroundColor: .systemGray6, likeBackgroundColor: .systemYellow)
    private var fuLikeView = PUILikeView(defaultEmoji: "🤢", likeEmoji: "🤮", defaultBackgroundColor: .systemGray6, likeBackgroundColor: .systemGreen)
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [beerLikeView, fuLikeView])
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    override func configure() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
