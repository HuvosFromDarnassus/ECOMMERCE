//
//  Constants.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

struct Constants {
    struct Style {
        static let accentColor: String = "AccentColor"
        static let backgroundColor: String = "BackgroundColor"
        static let backgroundGreyColor: String = "BackgroundGreyColor"
    }
    
    struct Main {
        static let APIString: String = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        
        static let productDetailsSegueId = "goToProductDetails"
        
        static let categoryNibName: String = "CategoryViewCell"
        static let categoryIdentifier: String = "categoryCell"
        
        static let hotSalesNibName: String = "HotSalesViewCell"
        static let hotSalesIdentifier: String = "hotSalesCell"
        
        static let bestSellerNibName: String = "BestSellerViewCell"
        static let bestSellerIdentifier: String = "bestSellerCell"
    }
    
    struct ProductDetails {
        static let APIString: String = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    }
    
    struct Cart {
        static let APIString: String = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    }
}
