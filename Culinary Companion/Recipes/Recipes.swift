//
//  Recipes.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/23/23.
//

import SwiftUI

struct Recipes: View {
    let items = ["Apple Cinnamon Muffins", "Banana Nut Bread", "Caesar Salad", "Dark Chocolate Brownies", "Eggplant Parmesan", "Fluffy Pancakes", "Garlic Herb Roasted Chicken", "Honey Glazed Salmon", "Italian Meatballs", "Maize Munchies"]

    // Define the grid layout
    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 20) {
                    ForEach(items, id: \.self) { item in
                        NavigationLink(destination: Recipe(item: item)) {
                            Text(item)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding() // Add padding around the grid
            }
            .navigationBarTitle("Recipes")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    Recipes()
}
