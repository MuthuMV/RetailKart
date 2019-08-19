//
//  CartTableViewController.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    var shoppingCart: ShoppingCart! {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCart = ShoppingCart(products: [])
        
        self.setTableView()
        navigationItem.title = "SHOPPING CART"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let decoded = UserDefaults.standard.data(forKey: UserDefaultIdentifiers.shoppingCart), let cart = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? ShoppingCart {
            self.shoppingCart = cart
        }
    }
    
    func setTableView() {
        self.tableView.estimatedRowHeight = tableView.rowHeight
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shoppingCart.numberOfItems() > 0 {
            // 0 - Cart Items Count
            // count+1 - Cart Items Details
            // count+2 - Cart Checkout
            return shoppingCart.items.count + 3
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if shoppingCart.numberOfItems() == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartItemsCountCell, for: indexPath) as! CartItemsCountTableViewCell
            cell.cartItemsCountLabel.text = "\(0) ITEM"
            return cell
        }
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartItemsCountCell, for: indexPath) as! CartItemsCountTableViewCell
            cell.cartItemsCountLabel.text = "\(shoppingCart.items.count) ITEMS"
            return cell
        case shoppingCart.numberOfItems()+1:
            // cartDetailCell
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartDetailCell, for: indexPath) as! CartDetailsTableViewCell
            cell.cart = self.shoppingCart
            return cell
        case shoppingCart.numberOfItems()+2:
            // checkoutButtonCell
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.checkoutButtonCell, for: indexPath) as! CartCheckoutTableViewCell
            cell.delegate = self
            return cell
        default:
            // cartItemCell
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartItemsCell, for: indexPath) as! CartItemTableViewCell
            cell.delegate = self
            cell.product = shoppingCart.items[indexPath.row - 1]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let productDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryBoardIdentifiers.productDetailViewController) as? ProductDetailTableViewController {
            productDetailVC.product = shoppingCart.items?[indexPath.row - 1]
            self.navigationController?.pushViewController(productDetailVC, animated: true)
        }
    }
}

// MARK: - Cart Items Update
extension CartTableViewController: CartItemUpdateDelegate {
    func removeItem(product: Product) {
        self.shoppingCart.removeItem(product)
        self.tableView.reloadData()
        self.tabBarController?.tabBar.items![1].badgeValue = "\(shoppingCart.numberOfItems())"
    }
}

// MARK: - Cart Checkout
extension CartTableViewController: CartCheckoutDelegate {
    func checkout() {
        let alert = UIAlertController(title: "Done!", message: "Thank you for Shopping with RetailKart.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel , handler:{ (UIAlertAction)in
            self.shoppingCart.emptyCart()
            self.tableView.reloadData()
            self.tabBarController?.tabBar.items![1].badgeValue = nil
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
