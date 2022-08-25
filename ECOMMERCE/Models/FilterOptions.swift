//
//  FilterOptions.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 25.08.2022.
//

struct FilterOptions {
    let brands: [String]
    let pricesRange: [String]
    let sizes: [String]
}

extension FilterOptions {
    static let testData: FilterOptions = FilterOptions(
        brands: ["Apple", "Samsung", "Xiaomi", "Huawei"],
        
        pricesRange: [
            "$100 - $200",
            "$300 - $500",
            "$600 - $800",
            "$1000 - $1500",
            "$1600 - $2000",
            "$2500 - $3000",
            "$4000 - $5000",
            "$6000 - $10000"
        ],
        
        sizes: [
            "2 to 2.5 inches",
            "3 to 3.5 inches",
            "4 to 4.5 inches",
            "5 to 5.5 inches",
            "6 to 6.5 inches",
            "6.5 and more"
        ])
}
