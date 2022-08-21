//
//  Category.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import UIKit

struct Category {
    var image: (unselected: UIImage, selected: UIImage)
    let label: String
    var isSelect: Bool
}

extension Category {
    static let categories: [Category] = [
        Category(image: (UIImage(named: "phoneIconUnSelected")!, UIImage(named: "phoneIconSelected")!), label: "Phones", isSelect: true),
        Category(image: (UIImage(named: "computerIconUnSelected")!, UIImage(named: "computerIconSelected")!), label: "Computer", isSelect: false),
        Category(image: (UIImage(named: "healthIconUnSelected")!, UIImage(named: "healthIconSelected")!), label: "Health", isSelect: false),
        Category(image: (UIImage(named: "booksIconUnSelected")!, UIImage(named: "booksIconSelected")!), label: "Books", isSelect: false),
        Category(image: (UIImage(named: "phoneIconUnSelected")!, UIImage(named: "phoneIconSelected")!), label: "Phones", isSelect: false),
        Category(image: (UIImage(named: "computerIconUnSelected")!, UIImage(named: "computerIconSelected")!), label: "Computer", isSelect: false),
        Category(image: (UIImage(named: "healthIconUnSelected")!, UIImage(named: "healthIconSelected")!), label: "Health", isSelect: false),
        Category(image: (UIImage(named: "booksIconUnSelected")!, UIImage(named: "booksIconSelected")!), label: "Books", isSelect: false)
    ]
}
