//
//  HomeTableViewController.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var products: [Product]?
    var filteredProducts: [Product]?
    var viewModel: HomeViewModel!
    var productCategory: ProductCategoryType! {
        didSet {
            navigationItem.title = productCategory.rawValue
            self.filteredProducts = self.products?.filter({$0.type == productCategory})
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel()
        
        self.setNavigationBar()
        self.setCartBar()
        self.setTableView()

        products = self.fetchProducts()
        productCategory = .ELECTRONICS
    }
    
    func setNavigationBar() {
        let chooseCategoryButton = UIBarButtonItem(title: "Categories", style: .plain, target: self, action: #selector(chooseHomeFeedCategory))
        chooseCategoryButton.tintColor = .black
        navigationItem.rightBarButtonItem = chooseCategoryButton
    }
    
    func setTableView() {
        self.tableView.register(UINib(nibName: CellIdentifiers.homeFeedCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.homeFeedCell)
        self.tableView.estimatedRowHeight = tableView.rowHeight
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setCartBar() {
        if let decoded = UserDefaults.standard.data(forKey: UserDefaultIdentifiers.shoppingCart), let cart = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? ShoppingCart {
            self.tabBarController?.tabBar.items![1].badgeValue = "\(cart.numberOfItems())"
        }
    }
    
    @objc func chooseHomeFeedCategory() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: ProductCategoryType.ELECTRONICS.rawValue, style: .default , handler:{ (UIAlertAction)in
            self.productCategory = .ELECTRONICS
        }))
        actionSheet.addAction(UIAlertAction(title: ProductCategoryType.FURNITURES.rawValue, style: .default , handler:{ (UIAlertAction)in
            self.productCategory = .FURNITURES
        }))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverController = actionSheet.popoverPresentationController {
                popoverController.sourceView = self.tableView
                popoverController.sourceRect = CGRect(x: self.tableView.bounds.maxX, y: self.tableView.bounds.minY+100, width: 0, height: 0)
            }
        }
        self.present(actionSheet, animated: true, completion: nil)
    }

    func fetchProducts() -> [Product] {
        return viewModel.fetchData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProducts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.homeFeedCell, for: indexPath) as! HomeFeedTableViewCell
        cell.product = filteredProducts?[indexPath.row]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let productDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryBoardIdentifiers.productDetailViewController) as? ProductDetailTableViewController {
            productDetailVC.product = filteredProducts?[indexPath.row]
            self.navigationController?.pushViewController(productDetailVC, animated: true)
        }
    }
}
