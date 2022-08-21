//
//  MainViewModel.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import Foundation
import UIKit

final class MainViewModel {
    public var homeStoreOutput: Dynamic = Dynamic([HomeStore]())
    public var bestSellerOutput: Dynamic = Dynamic([BestSeller]())
    
    public var homeStoreImages: Dynamic = Dynamic([Data]())
    public var bestSellerImages: Dynamic = Dynamic([Data]())
    
    public func requestData() {
        guard let url = URL(string: Constants.Main.APIString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let allProducts = try JSONDecoder().decode(MainProducts.self, from: data)
                
                self.homeStoreOutput.value = allProducts.homeStore
                self.bestSellerOutput.value = allProducts.bestSeller
                
                self.homeStoreImages.value = self.downloadImages(by: allProducts.homeStore.map { $0.picture })
                self.bestSellerImages.value = self.downloadImages(by: allProducts.bestSeller.map { $0.picture })
            } catch {
                print(error)
            }
        }.resume()
    }
    
    private func downloadImages(by urls: [String]) -> [Data] {
        var images: [Data] = []
        
        urls.forEach { urlString in
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = data else { return }
                
                images.append(data)
            }.resume()
        }
        
        return images
    }
}
