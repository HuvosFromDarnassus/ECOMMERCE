//
//  MainViewController.swift
//  ECOMMERCE
//
//  Created by Daniel Tvorun on 21.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var locationPullDownButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var hotSalesCollectionView: UICollectionView!
    @IBOutlet weak var bestSellerCollectionView: UICollectionView!
    
    private let viewModel: MainViewModel = MainViewModel()
    
    private var categories: [Category] = Category.categories
    
    private var hotSalesTextData: [HomeStore] = []
    private var hotSalesImages: [UIImage] = []
    
    private var bestSellerTextData: [BestSeller] = []
    private var bestSellerImages: [UIImage] = []
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.requestData()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        setupViewController()
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
    }
}

// MARK: - ViewModelBindable
extension MainViewController: ViewModelBindable {
    internal func bindViewModel() {
        viewModel.homeStoreOutput.bind { data in
            self.hotSalesTextData = data
        }
        
        viewModel.bestSellerOutput.bind { data in
            self.bestSellerTextData = data
        }
        
        viewModel.homeStoreImages.bind { data in
            data.forEach { dataElement in
                self.hotSalesImages.append(UIImage(data: dataElement)!)
            }
            
            DispatchQueue.main.async {
                self.hotSalesCollectionView.reloadData()
            }
        }
        
        viewModel.bestSellerImages.bind { data in
            data.forEach { dataElement in
                self.bestSellerImages.append(UIImage(data: dataElement)!)
            }
            
            DispatchQueue.main.async {
                self.bestSellerCollectionView.reloadData()
            }
        }
    }
}

// MARK: - ViewControllerSetupable
extension MainViewController: ViewControllerSetupable {
    internal func setupViewController() {
        setupCategoryCollectionView()
        setupHotSalesCollectionView()
        setupBestSellerCollectionView()
        setupSerachBar()
        setupQrButton()
    }
    
    private func setupCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: Constants.Main.categoryNibName, bundle: nil), forCellWithReuseIdentifier: Constants.Main.categoryIdentifier)
        selectCategory(number: 0)
        setupCollectionCellSize(for: categoryCollectionView, itemsPerRow: 4, cellHeight: 93, scrollDirection: .horizontal)
    }
    
    private func setupHotSalesCollectionView() {
        hotSalesCollectionView.dataSource = self
        hotSalesCollectionView.register(UINib(nibName: Constants.Main.hotSalesNibName, bundle: nil), forCellWithReuseIdentifier: Constants.Main.hotSalesIdentifier)
        setupCollectionCellSize(for: hotSalesCollectionView, itemsPerRow: 1, cellHeight: 182, scrollDirection: .horizontal)
    }
    
    private func setupBestSellerCollectionView() {
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
}

// MARK: - CollectionViewSetupable
extension MainViewController: CollectionViewSetupable {
    internal func setupCollectionCellSize(for collectionView: UICollectionView, itemsPerRow: Int, cellHeight: Int, scrollDirection: UICollectionView.ScrollDirection) {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds
        let itemSize = CGSize(width: Int(screenSize.width - 35) / itemsPerRow - 1, height: cellHeight)
        
        setupCellLayout(using: &layout, itemSize, direction: scrollDirection)
        
        collectionView.collectionViewLayout = layout
    }
    
    internal func setupCellLayout(using layout: inout UICollectionViewFlowLayout, _ itemSize: CGSize, direction: UICollectionView.ScrollDirection) {
        layout.scrollDirection = direction
        layout.itemSize = itemSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 2
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.categoryCollectionView:
            return categories.count
            
        case self.hotSalesCollectionView:
            return hotSalesTextData.count
            
        case self.bestSellerCollectionView:
            return bestSellerTextData.count
            
        default:
            return 0
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.categoryCollectionView:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Main.categoryIdentifier, for: indexPath) as! CategoryViewCell
            setupCategoryCell(using: indexPath.row, cell: &cell)
            return cell
            
        case self.hotSalesCollectionView:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Main.hotSalesIdentifier, for: indexPath) as! HotSalesViewCell
            setupHotSalesCell(using: indexPath.row, cell: &cell)
            return cell
            
        case self.bestSellerCollectionView:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Main.bestSellerIdentifier, for: indexPath) as! BestSellerViewCell
            setupBestSellerCell(using: indexPath.row, cell: &cell)
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    private func setupCategoryCell(using index: Int, cell: inout CategoryViewCell) {
        if categories[index].isSelect {
            cell.backgroundCircle.tintColor = UIColor(named: Constants.Style.accentColor)
            cell.categoryImage.image = categories[index].image.selected
        } else {
            cell.backgroundCircle.tintColor = .white
            cell.categoryImage.image = categories[index].image.unselected
        }
        
        cell.categoryLabel.text = categories[index].label
    }
    
    private func setupHotSalesCell(using index: Int, cell: inout HotSalesViewCell) {
        let textData = hotSalesTextData[index]
        
        cell.layer.cornerRadius = 10
        
        cell.backgroundImage.image = hotSalesImages[index]
        cell.title.text = textData.title
        cell.subtitle.text = textData.subtitle
        
        if let _ = textData.isNew {
            cell.isNewView.isHidden = false
        }
    }
    
    private func setupBestSellerCell(using index: Int, cell: inout BestSellerViewCell) {
        let textData = bestSellerTextData[index]
        
        cell.layer.cornerRadius = 10
        
        cell.productImage.image = bestSellerImages[index]
        cell.setPrice(String(textData.priceWithoutDiscount))
        cell.setDiscountPrice(String(textData.discountPrice))
        cell.productNameLabel.text = textData.title
        
        
        cell.isFavoriteImage.image = textData.isFavorites ? UIImage(named: "likeFillIcon") : UIImage(named: "likeIcon")
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
