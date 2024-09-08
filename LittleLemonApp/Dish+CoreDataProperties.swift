//
//  Dish+CoreDataProperties.swift
//  LittleLemonApp
//
//  Created by Konstantin Peev on 8.09.24.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var descriptionText: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Float

}

extension Dish : Identifiable {

}
