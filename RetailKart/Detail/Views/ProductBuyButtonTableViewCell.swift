//
//  ProductBuyButtonTableViewCell.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

protocol CartBadgeUpdateDelegate: class {
    func updateCartBadge(count: Int)
}


class ProductBuyButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productBuyButton: UIButton!
    weak var delegate: CartBadgeUpdateDelegate?
    
    @IBAction func productBuyButtonClicked(_ sender: UIButton) {
        sender.clickAnimation()
        if let decoded = UserDefaults.standard.data(forKey: UserDefaultIdentifiers.shoppingCart), let cart = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? ShoppingCart {
            cart.addItem(self.product)
            delegate?.updateCartBadge(count: cart.numberOfItems())
        }
        else {
            do {
                let cart = ShoppingCart(products: [self.product])
                let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: cart, requiringSecureCoding: false)
                UserDefaults.standard.set(encodedData, forKey: UserDefaultIdentifiers.shoppingCart)
                UserDefaults.standard.synchronize()
            } catch let error {
                print ("Error: \(error)")
            }
            delegate?.updateCartBadge(count: 1)
        }
    }
    
    var product: Product! {
        didSet {
            self.productBuyButton.setTitle("Add to Cart "+"\u{20B9}"+product.price.toString(), for: .normal)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productBuyButton.setTitle(nil, for: .normal)
    }
    
}
