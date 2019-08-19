//
//  ShoppingCartTests.swift
//  RetailKartTests
//
//  Created by Muthu on 8/16/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import XCTest
@testable import RetailKart

class ShoppingCartTests: XCTestCase {

    var cart: ShoppingCart!
    
    override func setUp() {
        cart = ShoppingCart(products: [])
    }

    override func tearDown() {
        cart = nil
        super.tearDown()
    }
    
    func testNumberOfItems() {
        XCTAssertNotNil(cart.numberOfItems(), "Cart is ready")
    }
    
    func testAddItemToCart() {
        //given
        XCTAssertEqual(cart.numberOfItems(), 0, "Empty Cart")
        
        //when
        cart.addItem(Product(id: 111, images: nil, name: "Microwave Oven", price: 543, type: .ELECTRONICS, details: nil))
        
        //then
        XCTAssertEqual(cart.numberOfItems(), 1, "One Item added to cart Successfully")
    }
    
    func testRemoveItemFromCart() {
        //given
        XCTAssertNotNil(cart.numberOfItems(), "Cart is ready")
        
        //when
        cart.removeItem(Product(id: 111, images: nil, name: "Microwave Oven", price: 543, type: .ELECTRONICS, details: nil))
        
        //then
        XCTAssertEqual(cart.numberOfItems(), 0, "One Item removed successfully")
    }
    
    func testTotalPrice() {
        //given
        XCTAssertEqual(cart.numberOfItems(), 0, "Empty Cart")
        
        //when
        cart.addItem(Product(id: 111, images: nil, name: "Microwave Oven", price: 543, type: .ELECTRONICS, details: nil))
        cart.addItem(Product(id: 55555, images: nil, name: "Table", price: 200000, type: .FURNITURES, details: "Amazing Table in the world"))
        
        //then
        XCTAssertEqual(cart.totalPrice, 220597.3, "Total Price calculated correctly")
    }
    
    func testContainsItemAtIndex() {
        //when
        let itemIndex = cart.containsItemAtIndex(Product(id: 1234567, images: nil, name: "Random Product", price: 45678, type: .ELECTRONICS, details: nil))
        
        //then
        XCTAssertNil(itemIndex, "Item is not Present")
    }
    
    func testCartEmpty() {
        //when
        cart.emptyCart()
        
        //then
        XCTAssertEqual(cart.numberOfItems(), 0, "Empty Cart")
    }

}
