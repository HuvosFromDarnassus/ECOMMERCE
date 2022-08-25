//
//  SetupMainViewControllerCollectionViews.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 25.08.2022.
//

import UIKit

// MARK: - CollectionViewSetupable
extension MainViewController: CollectionViewSetupable {
    internal func setupCollectionCellSize(for collectionView: UICollectionView, itemsPerRow: Int, cellHeight: Int, scrollDirection: UICollectionView.ScrollDirection) {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds
        let itemSize = CGSize(width: Int(screenSize.width - 35) / itemsPerRow - 1, height: cellHeight)
        
        setupCellLayout(using: &layout, itemSize, direction: scrollDirection)
        
        collectionView.collectionViewLayout = layout
    }
    
    internal func setupCellLayout(using layout: inout UICollectionViewFlowLayout, _ itemSize: CGSize, direction: UICollectionView.ScrollDirection) {
        layout.scrollDirection = direction
        layout.itemSize = itemSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 2
    }
}
