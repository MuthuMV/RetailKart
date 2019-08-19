//
//  Product.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import Foundation
import UIKit

class Product: NSObject, NSCoding {
    var id: Int!
    var images: [UIImage]?
    var name: String!
    var price: Float!
    var details: String?
    let type: ProductCategoryType!
    
    init(id: Int!, images: [UIImage]?, name: String!, price: Float!, type: ProductCategoryType!, details: String?) {
        self.id = id
        self.images = images
        self.name = name
        self.price = price
        self.type = type
        self.details = details
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! Int
        let images = aDecoder.decodeObject(forKey: "images") as? [UIImage]
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let price = aDecoder.decodeObject(forKey: "price") as! Float
        let details = aDecoder.decodeObject(forKey: "details") as? String
        let type = aDecoder.decodeObject(forKey: "type") as! String
        self.init(id: Int(id), images: images, name: name, price: price, type: ProductCategoryType(rawValue: type), details: details)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(images, forKey: "images")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(details, forKey: "details")
        aCoder.encode(type.rawValue, forKey: "type")
    }
}
