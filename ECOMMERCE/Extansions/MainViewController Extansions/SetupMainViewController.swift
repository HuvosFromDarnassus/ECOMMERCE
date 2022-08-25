//
//  SetupMainViewController.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 25.08.2022.
//

import UIKit

// MARK: - ViewControllerSetupable
extension MainViewController: ViewControllerSetupable {
    internal func setupViewController() {
        setupCategoryCollectionView()
        setupHotSalesCollectionView()
        setupBestSellerCollectionView()
        setupSerachBar()
        setupQrButton()
        setupFilterOptions()
        setupFooter()
    }
    
    private func setupCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: Constants.Main.categoryNibName, bundle: nil), forCellWithReuseIdentifier: Constants.Main.categoryIdentifier)
        selectCategory(number: 0)
        setupCollectionCellSize(for: categoryCollectionView, itemsPerRow: 4, cellHeight: 93, scrollDirection: .horizontal)
    }
    
    private func setupHotSalesCollectionView() {
        hotSalesCollectionView.delegate = self
        hotSalesCollectionView.dataSource = self
        hotSalesCollectionView.register(UINib(nibName: Constants.Main.hotSalesNibName, bundle: nil), forCellWithReuseIdentifier: Constants.Main.hotSalesIdentifier)
        setupCollectionCellSize(for: hotSalesCollectionView, itemsPerRow: 1, cellHeight: 182, scrollDirection: .horizontal)
    }
    
    private func setupBestSellerCollectionView() {
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.dataSource = self
        bestSellerCollectionView.register(UINib(nibName: Constants.Main.bestSellerNibName, bundle: nil), forCellWithReuseIdentifier: Constants.Main.bestSellerIdentifier)
        setupCollectionCellSize(for: bestSellerCollectionView, itemsPerRow: 2, cellHeight: 227, scrollDirection: .vertical)
    }
    
    private func setupSerachBar() {
        searchBar.searchTextField.leftView?.tintColor = UIColor(named: Constants.Style.accentColor)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.shadowOffset = CGSize(width: 2, height: 2)
        searchBar.layer.shadowOpacity = 0.1
    }
    
    private func setupQrButton() {
        qrButton.layer.cornerRadius = 16
    }
    
    private func setupFilterOptions() {
        filterOptionsView.layer.cornerRadius = 30
        setupDropDowns()
    }
    
    private func setupFooter() {
        footerView.layer.cornerRadius = 30
    }
}
