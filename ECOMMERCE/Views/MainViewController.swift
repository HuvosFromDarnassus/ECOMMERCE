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
    
    private let viewModel: MainViewModel = MainViewModel()
    
    private var categories: [Category] = Category.categories
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
    }
    
    private func setupViewController() {
        setupCategoryCollectionView()
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
            cell.backgroundCircle.tintColor = UIColor(named: "AccentColor")
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
