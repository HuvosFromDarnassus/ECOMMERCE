//
//  MainViewController.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var locationPullDownButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var qrButton: UIButton!
    
    private let viewModel: MainViewModel = MainViewModel()
    
    private var categories: [Category] = Category.categories
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        setupViewController()
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
    }
    
    private func setupViewController() {
        setupCategoryCollectionView()
        setupSerachBar()
        setupQrButton()
    }
    
    private func setupCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView.register(UINib(nibName: Constants.Main.categoryNibName, bundle: nil), forCellWithReuseIdentifier: Constants.Main.categoryIdentifier)
        
        selectCategory(number: 0)
        
        if let layout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 21
        }
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
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Main.categoryIdentifier, for: indexPath) as! CategoryViewCell
        setupCell(using: indexPath.row, cell: &cell)
        return cell
    }
    
    private func setupCell(using index: Int, cell: inout CategoryViewCell) {
        if categories[index].isSelect {
            cell.backgroundCircle.tintColor = UIColor(named: Constants.Style.accentColor)
            cell.categoryImage.image = categories[index].image.selected
        } else {
            cell.backgroundCircle.tintColor = .white
            cell.categoryImage.image = categories[index].image.unselected
        }
        
        cell.categoryLabel.text = categories[index].label
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCategory(number: indexPath.row)
    }
    
    private func selectCategory(number index: Int) {
        deselectAllCategories()
        categories[index].isSelect = true
        categoryCollectionView.reloadData()
    }
    
    private func deselectAllCategories() {
        for index in categories.indices {
            categories[index].isSelect = false
        }
    }
}
