//
//  HotSalesViewCell.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 22.08.2022.
//

import UIKit

final class HotSalesViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var isNewView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        isNewView.layer.cornerRadius = 15
        buyButton.titleLabel?.font = .boldSystemFont(ofSize: 11)
    }
}
