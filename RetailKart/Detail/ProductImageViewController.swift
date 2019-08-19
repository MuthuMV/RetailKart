//
//  ProductImageViewController.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class ProductImageViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.productImageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productImageView.image = image
    }
    
}
