//
//  HomeFeedTableViewCell.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedPriceLabel: UILabel!
    
    var product: Product! {
        didSet {
            self.updateView()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.feedImageView.image = nil
        self.feedTitleLabel.text = ""
        self.feedPriceLabel.text = ""
    }

    private func updateView() {
        self.feedTitleLabel.text = product.name
        self.feedPriceLabel.text = "\u{20B9}" + product.price.toString()
        self.feedImageView.image = product.images?.first ?? UIImage(named: "No image")
    }
    
}
