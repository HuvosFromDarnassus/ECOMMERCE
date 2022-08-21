//
//  MainViewModel.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import Foundation

final class MainViewModel {
    public var homeStoreOutput: Dynamic = Dynamic([HomeStore]())
    public var bestSellerOutput: Dynamic = Dynamic([BestSeller]())
    
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
            } catch {
                print(error)
            }
        }.resume()
    }
}
