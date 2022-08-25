//
//  SetupMainViewControllerDropDowns.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 25.08.2022.
//

// MARK: - DropDownsSetupable
extension MainViewController: DropDownsSetupable {
    internal func setupDropDowns() {
        setupBrandDropDown()
        setupPriceDropDown()
        setupSizeDropDown()
    }
    
    private func setupBrandDropDown() {
        brandDropDown.optionArray = FilterOptions.testData.brands
    }
    
    private func setupPriceDropDown() {
        priceDropDown.optionArray = FilterOptions.testData.pricesRange
    }
    
    private func setupSizeDropDown() {
        sizeDropDown.optionArray = FilterOptions.testData.sizes
    }
}
