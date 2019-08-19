//
//  CartItemTableViewCell.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

protocol CartItemUpdateDelegate: class {
    func removeItem(product: Product)
}

class CartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImageView.image = nil
        self.productNameLabel.text = nil
        self.productPriceLabel.text = nil
    }
    
    var product: Product! {
        didSet {
            self.updateView()
        }
    }
    weak var delegate: CartItemUpdateDelegate?
    
    private func updateView()
    {
        productImageView.image = product.images?.first ?? UIImage(named: "No image")
        productNameLabel.text = product.name
        productPriceLabel.text = "\u{20B9}" + product.price.toString()
    }
    
    @IBAction func removeButtonDidTap(_ sender: Any) {
        delegate?.removeItem(product: self.product)
    }
}
