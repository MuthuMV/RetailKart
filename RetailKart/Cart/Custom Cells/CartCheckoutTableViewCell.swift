//
//  CartCheckoutTableViewCell.swift
//  RetailKart
//
//  Created by Muthu on 8/16/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

protocol CartCheckoutDelegate: class {
    func checkout()
}

class CartCheckoutTableViewCell: UITableViewCell {
    
    weak var delegate: CartCheckoutDelegate?

    @IBAction func checkoutButtonClicked(_ sender: UIButton) {
        sender.clickAnimation()
        delegate?.checkout()
    }
}
