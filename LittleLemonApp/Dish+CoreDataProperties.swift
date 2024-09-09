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
    static func createDishesFrom(menuItems: [MenuItem], _ context: NSManagedObjectContext) {
           for menuItem in menuItems {
               // Check if the dish already exists, if it doesn't, create a new one
               if exists(name: menuItem.title, context) == nil {
                   // Create a new Dish since it does not exist
                   let oneDish = Dish(context: context)
                   oneDish.name = menuItem.title
                   oneDish.price = menuItem.price // Directly assign price since it's already a Float
                   oneDish.descriptionText = menuItem.descriptionText
                   oneDish.image = menuItem.image
               }
           }

           // Save the context after creating all dishes
           do {
               try context.save()
           } catch {
               print("Failed to save dishes: \(error)")
           }
       }

       // Helper method to check if a dish with the same name already exists
       static func exists(name: String, _ context: NSManagedObjectContext) -> Dish? {
           let request: NSFetchRequest<Dish> = Dish.fetchRequest()
           request.predicate = NSPredicate(format: "name == %@", name)
           request.fetchLimit = 1

           do {
               let result = try context.fetch(request)
               return result.first
           } catch {
               print("Error checking if dish exists: \(error)")
               return nil
           }
       }
}



