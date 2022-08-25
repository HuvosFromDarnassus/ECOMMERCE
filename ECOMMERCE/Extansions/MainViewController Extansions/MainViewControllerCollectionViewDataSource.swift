//
//  MainViewControllerCollectionViewDataSource.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 25.08.2022.
//

import UIKit

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.categoryCollectionView:
            return categories.count
            
        case self.hotSalesCollectionView:
            return hotSalesTextData.count
            
        case self.bestSellerCollectionView:
            return bestSellerTextData.count
            
        default:
            return 0
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.categoryCollectionView:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Main.categoryIdentifier, for: indexPath) as! CategoryViewCell
            setupCategoryCell(using: indexPath.row, cell: &cell)
            return cell
            
        case self.hotSalesCollectionView:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Main.hotSalesIdentifier, for: indexPath) as! HotSalesViewCell
            setupHotSalesCell(using: indexPath.row, cell: &cell)
            return cell
            
        case self.bestSellerCollectionView:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Main.bestSellerIdentifier, for: indexPath) as! BestSellerViewCell
            setupBestSellerCell(using: indexPath.row, cell: &cell)
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    private func setupCategoryCell(using index: Int, cell: inout CategoryViewCell) {
        if categories[index].isSelect {
            cell.backgroundCircle.tintColor = UIColor(named: Constants.Style.accentColor)
            cell.categoryImage.image = categories[index].image.selected
        } else {
            cell.backgroundCircle.tintColor = .white
            cell.categoryImage.image = categories[index].image.unselected
        }
        
        cell.categoryLabel.text = categories[index].label
    }
    
    private func setupHotSalesCell(using index: Int, cell: inout HotSalesViewCell) {
        let textData = hotSalesTextData[index]
        
        cell.layer.cornerRadius = 10
        
        cell.backgroundImage.image = hotSalesImages[index]
        cell.title.text = textData.title
        cell.subtitle.text = textData.subtitle
        
        if let _ = textData.isNew {
            cell.isNewView.isHidden = false
        }
    }
    
    private func setupBestSellerCell(using index: Int, cell: inout BestSellerViewCell) {
        let textData = bestSellerTextData[index]
        
        cell.layer.cornerRadius = 10
        
        cell.productImage.image = bestSellerImages[index]
        cell.setPrice(String(textData.priceWithoutDiscount))
        cell.setDiscountPrice(String(textData.discountPrice))
        cell.productNameLabel.text = textData.title
        
        cell.isFavoriteImage.image = textData.isFavorites ? UIImage(named: "likeFillIcon") : UIImage(named: "likeIcon")
    }
}
