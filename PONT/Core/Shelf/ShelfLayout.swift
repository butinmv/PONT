//
//  ShelfLayout.swift
//  PONT
//
//  Created by Maxim Butin on 11.09.2022.
//

import UIKit

// MARK: - Create Layout
extension ShelfViewController {
    
    enum Layout {
        
        static var spacing: CGFloat = 16
        static var inset: CGFloat = 16
        
        enum Group {
            static var width: CGFloat = 0.25
            static var height: CGFloat = 200
        }
        
        enum Section {
            static var contentInsets = EdgeInsets(bottom: 16, horizontal: 16)
        }
        
        enum Header {
            static var height: CGFloat = 64
        }
        
        enum Footer {
            static var height: CGFloat = 64
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = {
            (sectionIndex: Int, layoutEnvironment: LayoutEnvironment)
            -> LayoutSection? in
            
            let itemSize = LayoutSize(widthDimension: .fractionalWidth(1),
                                      heightDimension: .fractionalHeight(1))
            let item = LayoutItem(layoutSize: itemSize)
            let groupSize = LayoutSize(widthDimension: .fractionalWidth(Layout.Group.width),
                                       heightDimension: .absolute(Layout.Group.height))
            let group = LayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = LayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = Layout.spacing
            section.contentInsets = Layout.Section.contentInsets
            section.decorationItems = [
                LayoutDecorationItem.background(elementKind: ShelfBackgroundView.description()),
            ]
            
            let headerSize = LayoutSize(widthDimension: .fractionalWidth(1),
                                        heightDimension: .estimated(Layout.Header.height))
            let headerSupplementary = SupplementaryItem(layoutSize: headerSize,
                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                        alignment: .top)
            let bottomSize = LayoutSize(widthDimension: .fractionalWidth(1),
                                        heightDimension: .estimated(Layout.Footer.height))
            let bottomSupplementary = SupplementaryItem(layoutSize: bottomSize,
                                                        elementKind: UICollectionView.elementKindSectionFooter,
                                                        alignment: .bottom)
           
            section.boundarySupplementaryItems = [headerSupplementary, bottomSupplementary]
            
            return section
        }
        
        let config = LayoutConfiguration()
        config.interSectionSpacing = Layout.spacing
        
        let layout = CompositionalLayout(sectionProvider: sectionProvider,
                                         configuration: config)
        
        layout.register(ShelfBackgroundView.self, forDecorationViewOfKind: ShelfBackgroundView.description())
        
        return layout
    }
}

