//
//  ViewController.swift
//  PONT
//
//  Created by Maxim Butin on 10.09.2022.
//

import UIKit
import SnapKit

class ShelfViewController: UIViewController {
    
    private let sections = Section.allSections
    private var collectionView: UICollectionView! = nil
    private var dataSource: DataSource<Shelf, Alcohol>! = nil
    private var currentSnapshot: Snapshot<Shelf, Alcohol>! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureDataSource()
    }
}

extension ShelfViewController {
    
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = {
            (sectionIndex: Int, layoutEnvironment: LayoutEnvironment)
            -> LayoutSection? in
            
            let itemSize = LayoutSize(widthDimension: .fractionalWidth(1),
                                      heightDimension: .fractionalHeight(1))
            let item = LayoutItem(layoutSize: itemSize)
            let groupSize = LayoutSize(widthDimension: .fractionalWidth(0.25),
                                       heightDimension: .absolute(200))
            let group = LayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = LayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 16
            section.contentInsets = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            
            let headerSize = LayoutSize(widthDimension: .fractionalWidth(1),
                                       heightDimension: .estimated(64))
            let headerSupplementary = SupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
            section.boundarySupplementaryItems = [headerSupplementary]
            
            return section
        }
        
        let config = LayoutConfiguration()
        config.interSectionSpacing = 16
        
        let layout = CompositionalLayout(sectionProvider: sectionProvider,
                                         configuration: config)
        
        return layout
    }
}

extension ShelfViewController {
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        collectionView.backgroundColor = .systemBackground
    }
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<AlcoholCollectionViewCell, Alcohol> {
            (cell, indexPath, alcohol) in
        
            cell.alcohol = alcohol
        }
        
        dataSource = DataSource<Shelf, Alcohol>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, alcohol: Alcohol) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: alcohol)
        }
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration<HeaderSupplementaryView>(elementKind: "header") {
            (supplementaryView, string, indexPath) in
            
            if let snapshot = self.currentSnapshot {
                let shelf = snapshot.sectionIdentifiers[indexPath.section]
                supplementaryView.person = shelf.person
            }
        }
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: supplementaryRegistration, for: index)
        }
        
        currentSnapshot = Snapshot<Shelf, Alcohol>()
        sections.forEach {
            let shelf = $0
            currentSnapshot.appendSections([shelf])
            currentSnapshot.appendItems(shelf.alcohols)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}
