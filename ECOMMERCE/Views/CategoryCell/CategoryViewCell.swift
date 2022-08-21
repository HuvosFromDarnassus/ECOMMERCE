//
//  CategoryViewCell.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundCircle: UIImageView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImage()
    }
    
    private func setupImage() {
        backgroundCircle.layer.shadowOffset = CGSize(width: 2, height: 2)
        backgroundCircle.layer.shadowOpacity = 0.1
    }
}
