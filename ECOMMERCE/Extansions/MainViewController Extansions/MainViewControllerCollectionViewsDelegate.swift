//
//  MainViewControllerCollectionViewsDelegate.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 25.08.2022.
//

import UIKit

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCategory(number: indexPath.row)
        
        if collectionView != categoryCollectionView {
            performSegue(withIdentifier: Constants.Main.productDetailsSegueId, sender: self)
        }
    }
    
    internal func selectCategory(number index: Int) {
        deselectAllCategories()
        categories[index].isSelect = true
        categoryCollectionView.reloadData()
    }
    
    private func deselectAllCategories() {
        for index in categories.indices {
            categories[index].isSelect = false
        }
    }
}
