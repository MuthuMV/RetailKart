//
//  ShoppingCart.swift
//  RetailKart
//
//  Created by Muthu on 8/16/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import Foundation

class ShoppingCart: NSObject, NSCoding {
    var items: [Product]!
    let shippingCharge: Float = 0
    var subTotalPrice: Float!
    var taxPrice: Float!    //10% of SubTotal
    var totalPrice: Float!
    
    init(products: [Product]) {
        super.init()
        self.items = products
        self.updateCartValue()
    }
    
    func addItem(_ item: Product) {
        self.items.append(item)
        self.updateCartValue()
        self.updateUserDefaults()
    }
    
    func removeItem(_ item: Product) {
        if let index = items?.firstIndex(where: {$0.id == item.id}) {
            self.items?.remove(at: index)
        }
        self.updateCartValue()
        self.updateUserDefaults()
    }
    
    // Updates the Cart object in UserDefaults
    func updateUserDefaults() {
        do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: UserDefaultIdentifiers.shoppingCart)
            UserDefaults.standard.synchronize()
        } catch let error {
            print ("Error: \(error)")
        }
    }
    
    func containsItemAtIndex(_ item: Product) -> Int? {
        if let index = items?.firstIndex(where: {$0.id == item.id}) {
            return index
        }
        return nil
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    // Removes the items and Cart object from UserDefaults
    func emptyCart() {
        self.items.removeAll()
        self.updateCartValue()
        UserDefaults.standard.removeObject(forKey: UserDefaultIdentifiers.shoppingCart)
    }
    
    func updateCartValue() {
        var subTotal: Float = 0
        for item in items {
            subTotal += item.price
        }
        self.subTotalPrice = subTotal
        self.taxPrice = subTotal/10
        self.totalPrice = subTotalPrice + shippingCharge + taxPrice
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let items = aDecoder.decodeObject(forKey: "items") as! [Product]
        self.init(products: items)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(items, forKey: "items")
    }
}
