//
//  FilterView.swift
//  LittleLemonApp
//
//  Created by Konstantin Peev on 8.09.24.
//

import Foundation
import SwiftUI

struct FilterView: View {
    @Binding var sortField: String
    @Binding var isAscending: Bool
    @Binding var showFilter: Bool

    var body: some View {
        VStack {
            Text("Filters")
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)

            Picker("Sort by", selection: $sortField) {
                Text("Name").tag("name")
                Text("Price").tag("price")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Toggle("Ascending", isOn: $isAscending)
                .padding()

            Button(action: {
                showFilter = false // Dismiss the filter view
            }) {
                Text("Apply Filters")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top)

            Spacer()
        }
        .padding()
        .background(Color.blue.opacity(0.9))
        .cornerRadius(20)
        .shadow(radius: 10)
        .frame(maxWidth: .infinity, maxHeight: 300)
    }
}
