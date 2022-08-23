//
//  BestSellerViewCell.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 23.08.2022.
//

import UIKit

final class BestSellerViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var isFavoriteView: UIView!
    @IBOutlet weak var isFavoriteImage: UIImageView!
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        isFavoriteView.layer.cornerRadius = 15
    }
    
    public func setPrice(_ text: String) {
        priceLabel.text = "$\(text)"
    }
    
    public func setDiscountPrice(_ text: String) {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$\(text)")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        
        oldPriceLabel.attributedText = attributeString
    }
}
