//
//  ProductDetailTableViewController.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var productImagesHeaderView: ProductImagesHeaderView!
    @IBOutlet weak var noImageView: UIImageView!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.setTableView()
        title = product.name
    }

    func registerCells() {
        self.tableView.register(UINib(nibName: CellIdentifiers.productBuyButtonCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.productBuyButtonCell)
        self.tableView.register(UINib(nibName: CellIdentifiers.productDescriptionCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.productDescriptionCell)
    }
    
    func setTableView() {
        self.tableView.tableHeaderView = productImagesHeaderView
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 0 - product detail cell
        // 1 - product buy button
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productDescriptionCell, for: indexPath) as! ProductDescriptionTableViewCell
            cell.product = self.product
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productBuyButtonCell, for: indexPath) as! ProductBuyButtonTableViewCell
            cell.delegate = self
            cell.product = self.product
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoardIdentifiers.productImagesPageViewController {
            if let imagesPageVC = segue.destination as? ProductImagesPageViewController {
                imagesPageVC.images = product.images
                imagesPageVC.pageViewControllerDelegate = productImagesHeaderView
            }
        }
    }
}

extension ProductDetailTableViewController: CartBadgeUpdateDelegate {
    func updateCartBadge(count: Int) {
        self.tabBarController?.tabBar.items![1].badgeValue = "\(count)"
    }
}
