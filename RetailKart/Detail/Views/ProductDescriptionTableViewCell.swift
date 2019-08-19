//
//  ProductDescriptionTableViewCell.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class ProductDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    var product: Product! {
        didSet {
            self.updateView()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productNameLabel.text = nil
        self.productDescriptionTextView.text = ""
    }
    
    private func updateView() {
        self.productNameLabel.text = product.name
        if let details = product.details {
            self.productDescriptionTextView.text = details
        }
    }
}
