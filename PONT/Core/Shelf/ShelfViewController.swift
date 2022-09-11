//
//  ViewController.swift
//  PONT
//
//  Created by Maxim Butin on 10.09.2022.
//

import UIKit
import SnapKit

class ShelfViewController: UIViewController {
    
    // MARK: - Properties
    private let sections = Section.allSections
    private var collectionView: UICollectionView! = nil
    private var dataSource: DataSource<Shelf, Alcohol>! = nil
    private var currentSnapshot: Snapshot<Shelf, Alcohol>! = nil
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureDataSource()
    }
    
    // MARK: - Methods
    
    private func configureHierarchy() {
        view.backgroundColor = .systemBackground
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Layout.inset)
        }
        collectionView.backgroundColor = .clear
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
        
        let headerSupplementaryRegistration = UICollectionView.SupplementaryRegistration<HeaderSupplementaryView>(elementKind: UICollectionView.elementKindSectionHeader) {
            (supplementaryView, string, indexPath) in

            if let snapshot = self.currentSnapshot {
                let shelf = snapshot.sectionIdentifiers[indexPath.section]
                supplementaryView.person = shelf.person
            }
        }

        let bottomSupplementaryRegistration = UICollectionView.SupplementaryRegistration<BottomSupplementaryView>(
            elementKind: UICollectionView.elementKindSectionFooter
        ) { [unowned self] (supplementaryView, string, indexPath) in

            if let snapshot = self.currentSnapshot {
                
            }
        }
        
        dataSource.supplementaryViewProvider = { [unowned self]
            (collectionView, elementKind, indexPath) -> UICollectionReusableView? in
            
            if elementKind == UICollectionView.elementKindSectionHeader {
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerSupplementaryRegistration, for: indexPath)
            } else {
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: bottomSupplementaryRegistration, for: indexPath)
            }
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
