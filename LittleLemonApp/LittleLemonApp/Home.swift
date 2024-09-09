//
//  Home.swift
//  LittleLemonApp
//
//  Created by Konstantin Peev on 8.09.24.
//

import SwiftUI

struct Home: View {
    @StateObject private var cartManager = CartManager()

    var body: some View {
        TabView {
            // Menu Tab
            Menu()
                .environmentObject(cartManager)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            // Profile Tab
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
            CartView()
                .environmentObject(cartManager)
                           .tabItem {
                               Label("Cart", systemImage: "cart")
                           }
        }
        .navigationBarBackButtonHidden(true) // Disable back button
    }
}

#Preview {
    Home()
}
