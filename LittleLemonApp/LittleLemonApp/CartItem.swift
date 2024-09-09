//
//  CartItem.swift
//  LittleLemonApp
//
//  Created by Konstantin Peev on 8.09.24.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let dish: Dish
    var quantity: Int
}
