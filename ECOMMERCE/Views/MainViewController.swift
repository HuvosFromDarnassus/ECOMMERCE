//
//  MainViewController.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import UIKit
import iOSDropDown

final class MainViewController: UIViewController {
    @IBOutlet weak var locationPullDownButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var hotSalesCollectionView: UICollectionView!
    @IBOutlet weak var bestSellerCollectionView: UICollectionView!
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var filterOptionsView: UIView!
    @IBOutlet weak var brandDropDown: DropDown!
    @IBOutlet weak var priceDropDown: DropDown!
    @IBOutlet weak var sizeDropDown: DropDown!
    
    internal let viewModel: MainViewModel = MainViewModel()
    
    internal var categories: [Category] = Category.categories
    
    internal var hotSalesTextData: [HomeStore] = []
    internal var hotSalesImages: [UIImage] = []
    
    internal var bestSellerTextData: [BestSeller] = []
    internal var bestSellerImages: [UIImage] = []
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.requestData()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        setupViewController()
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        if filterOptionsView.isHidden {
            UIView.transition(with: filterOptionsView,
                              duration: 0.4,
                              options: .transitionFlipFromBottom,
                              animations: { self.filterOptionsView.isHidden = false },
                              completion: nil)
        }
    }
    
    @IBAction func filterQuitButtonPressed(_ sender: UIButton) {
        filterOptionsView.isHidden = true
    }
}
