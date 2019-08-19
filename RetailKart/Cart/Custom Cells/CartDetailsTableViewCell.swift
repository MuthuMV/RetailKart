//
//  CartDetailsTableViewCell.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class CartDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subTotalValueLabel: UILabel!
    @IBOutlet weak var shippingValueLabel: UILabel!
    @IBOutlet weak var taxValueLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    override func prepareForReuse() {
        self.subTotalValueLabel.text = nil
        self.taxValueLabel.text = nil
        self.totalValueLabel.text = nil
    }
    
    var cart: ShoppingCart! {
        didSet {
            self.updateView()
        }
    }
    
    private func updateView() {
        self.subTotalValueLabel.text = "\u{20B9}" + cart.subTotalPrice.toString()
        self.taxValueLabel.text = "\u{20B9}" + cart.taxPrice.toString()
        self.totalValueLabel.text = "\u{20B9}" + cart.totalPrice.toString()
    }
    
}
