//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Konstantin Peev on 7.09.24.
//

import SwiftUI

@main
struct LittleLemonAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
