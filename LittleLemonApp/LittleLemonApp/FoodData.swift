//
//  FoodData.swift
//  LittleLemonApp
//
//  Created by Konstantin Peev on 8.09.24.
//

import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
}


struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let price: String
    let descriptionText: String
    let image: String
} 
