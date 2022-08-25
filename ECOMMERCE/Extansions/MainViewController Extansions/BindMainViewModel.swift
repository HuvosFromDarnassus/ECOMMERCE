//
//  BindMainViewModel.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 25.08.2022.
//

import UIKit

// MARK: - ViewModelBindable
extension MainViewController: ViewModelBindable {
    internal func bindViewModel() {
        viewModel.homeStoreOutput.bind { data in
            self.hotSalesTextData = data
        }
        
        viewModel.bestSellerOutput.bind { data in
            self.bestSellerTextData = data
        }
        
        viewModel.homeStoreImages.bind { data in
            self.appendImagesAndReloadCollectionView(data: data, to: &self.hotSalesImages, collectionViewToReload: self.hotSalesCollectionView)
        }
        
        viewModel.bestSellerImages.bind { data in
            self.appendImagesAndReloadCollectionView(data: data, to: &self.bestSellerImages, collectionViewToReload: self.bestSellerCollectionView)
        }
    }
    
    private func appendImagesAndReloadCollectionView(data: [Data], to images: inout [UIImage], collectionViewToReload: UICollectionView) {
        data.forEach { dataElement in
            images.append(UIImage(data: dataElement)!)
        }
        
        DispatchQueue.main.async {
            collectionViewToReload.reloadData()
        }
    }
}
