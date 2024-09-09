//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Konstantin Peev on 8.09.24.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: Float
    // (Optional) Add other properties as needed, like `description`
    let descriptionText: String?
}
