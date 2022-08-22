//
//  MainViewModel.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import UIKit

enum CollectoinType {
    case homeStore
    case bestseller
}

final class MainViewModel {
    public var homeStoreOutput: Dynamic = Dynamic([HomeStore(id: 0, isNew: false, title: "", subtitle: "", picture: "", isBuy: false)])
    public var bestSellerOutput: Dynamic = Dynamic([BestSeller(id: 0, isFavorites: false, title: "", priceWithoutDiscount: 0, discountPrice: 0, picture: "")])
    
    public var homeStoreImages: Dynamic = Dynamic([Data]())
    public var bestSellerImages: Dynamic = Dynamic([Data]())
    
    public func requestData() {
        guard let url = URL(string: Constants.Main.APIString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("MAIN VIEWMODEL REQUEST ERROR: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let allProducts = try JSONDecoder().decode(MainProducts.self, from: data)
                
                self.homeStoreOutput.value = allProducts.homeStore
                self.bestSellerOutput.value = allProducts.bestSeller
                
                self.downloadImages(for: .homeStore, by: allProducts.homeStore.map { $0.picture })
                self.downloadImages(for: .bestseller, by: allProducts.bestSeller.map { $0.picture })
            } catch {
                print("MAIN VIEWMODEL JSON ERROR: \(error)")
            }
        }.resume()
    }
    
    private func downloadImages(for type: CollectoinType, by urls: [String]) {
        var images: [Data] = []
        
        let group = DispatchGroup()
        
        urls.forEach { urlString in
            group.enter()
            
            URLSession.shared.dataTask(with: URL(string:urlString)!) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = data else { return }
                
                images.append(data)
                
                group.leave()
            }.resume()
        }
        
        group.notify(queue: .main) {
            switch type {
            case .homeStore:
                self.homeStoreImages.value = images
            case .bestseller:
                self.bestSellerImages.value = images
            }
        }
    }
}
