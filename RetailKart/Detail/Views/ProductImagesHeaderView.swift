//
//  ProductImagesHeaderView.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

class ProductImagesHeaderView: UIView {
    @IBOutlet weak var pageControl: UIPageControl!
}

extension ProductImagesHeaderView : ProductImagesPageViewControllerDelegate {
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int){
        pageControl.currentPage = index
    }
}
