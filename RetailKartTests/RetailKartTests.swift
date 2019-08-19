//
//  RetailKartTests.swift
//  RetailKartTests
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import XCTest
@testable import RetailKart

class RetailKartTests: XCTestCase {
    
    var electronicProduct: Product!
    var furnitureProduct: Product!

    override func setUp() {
        electronicProduct = Product(id: 111, images: nil, name: "Microwave Oven", price: 543, type: .ELECTRONICS, details: nil)
        furnitureProduct = Product(id: 55555, images: nil, name: "Table", price: 200000, type: .FURNITURES, details: "Amazing Table in the world")
    }

    override func tearDown() {
        electronicProduct = nil
        furnitureProduct = nil
        super.tearDown()
    }
    
    func testProductCategories() {
        XCTAssertTrue(electronicProduct.type != furnitureProduct.type, "Products are of different Types")
    }
    
    func testProductImages() {
        XCTAssertNil(electronicProduct.images, "Products can have no pictures")
    }

}
