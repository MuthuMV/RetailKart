//
//  HomeViewModel.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

protocol HomeFeedDelegate {
    func fetchData() -> [Product]
}

class HomeViewModel: HomeFeedDelegate {
    func fetchData() -> [Product] {
        var products: [Product] = []
        
        let microwaveOven = Product(id: 111, images: [UIImage(named: "oven 1")!, UIImage(named: "oven 2")!, UIImage(named: "oven 3")!, UIImage(named: "oven 4")!, UIImage(named: "oven 5")!], name: "Microwave Oven", price: 5500, type: .ELECTRONICS, details: "A microwave oven (also commonly referred to as a microwave) is an electric oven that heats and cooks food by exposing it to electromagnetic radiation in the microwave frequency range.[1] This induces polar molecules in the food to rotate and produce thermal energy in a process known as dielectric heating. Microwave ovens heat foods quickly and efficiently because excitation is fairly uniform in the outer 25–38 mm (1–1.5 inches) of a homogeneous, high water content food item.")
        let television = Product(id: 222, images: [UIImage(named: "tv 1")!, UIImage(named: "tv 2")!, UIImage(named: "tv 3")!, UIImage(named: "tv 4")!, UIImage(named: "tv 5")!, UIImage(named: "tv 6")!], name: "Television", price: 60000, type: .ELECTRONICS, details: "Television (TV), sometimes shortened to tele or telly, is a telecommunication medium used for transmitting moving images in monochrome (black and white), or in colour, and in two or three dimensions and sound. The term can refer to a television set, a television program, or the medium of television transmission. Television is a mass medium for advertising, entertainment and news.")
        let vaccumCleaner = Product(id: 333, images: [UIImage(named: "vaccum 2")!, UIImage(named: "vaccum 3")!, UIImage(named: "vaccum 4")!], name: "Vacuum Cleaner", price: 3500, type: .ELECTRONICS, details: nil)
        let chair = Product(id: 444, images: [UIImage(named: "chair 2")!, UIImage(named: "chair 1")!, UIImage(named: "chair 3")!], name: "Chair", price: 10.0, type: .FURNITURES, details: "Chairs vary in design. An armchair has armrests fixed to the seat;[3] a recliner is upholstered and under its seat is a mechanism that allows one to lower the chair's back and raise into place a fold-out footrest;[4] a rocking chair has legs fixed to two long curved slats; a wheelchair has wheels fixed to an axis under the seat")
        let almirah = Product(id: 555, images: nil, name: "Almirah", price: 22000, type: .FURNITURES, details: nil)
        let table = Product(id: 666, images: [UIImage(named: "table 2")!, UIImage(named: "table 1")!, UIImage(named: "table 3")!, UIImage(named: "table 4")!], name: "Table", price: 200000, type: .FURNITURES, details: "A table is an item of furniture with a flat top and one or more legs, used as a surface for working at, eating from or on which to place things.[1][2] Some common types of table are the dining room table, which is used for seated persons to eat meals; the coffee table, which is a low table used in living rooms to display items or serve refreshments; and the bedside table, which is used to place an alarm clock and a lamp. There are also a range of specialized types of tables, such as drafting tables, used for doing architectural drawings, and sewing tables.")
        
        products.append(contentsOf: [microwaveOven, television, vaccumCleaner, chair, almirah, table])
        return products
    }
}
