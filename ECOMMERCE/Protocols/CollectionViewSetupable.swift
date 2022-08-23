//
//  CollectionViewSetupable.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 23.08.2022.
//

import UIKit

protocol CollectionViewSetupable {
    func setupCollectionCellSize(for collectionView: UICollectionView, itemsPerRow: Int, cellHeight: Int)
    func setupCellLayout(using layout: inout UICollectionViewFlowLayout, _ itemSize: CGSize)
}
