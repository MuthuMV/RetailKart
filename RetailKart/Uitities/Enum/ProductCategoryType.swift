//
//  ProductCategoryType.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import Foundation

enum ProductCategoryType: String {
    case ELECTRONICS = "Electronics"
    case FURNITURES = "Furnitures"
    
    static let values: [ProductCategoryType] = [.ELECTRONICS, .FURNITURES]
}
