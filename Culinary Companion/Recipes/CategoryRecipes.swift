//
//  Recipes.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/23/23.
//

import SwiftUI

struct CategoryRecipe {
    var title: String
    var imageName: String
}

struct CategoryRecipes: View {


    let recipes = [
          CategoryRecipe(title: "Apple Muffins", imageName: "apple-muffins-1"),
          CategoryRecipe(title: "Chicken Curry", imageName: "apple-muffins-1"),

      ]

      // Grid layout configuration
      private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

      var body: some View {
          ScrollView {
              LazyVGrid(columns: columns, spacing: 20) {
                  ForEach(recipes, id: \.title) { recipe in
                      VStack {
                          Image(recipe.imageName)
                              .resizable()
                              .scaledToFit()
                              .frame(height: 150)
                              .cornerRadius(10)
                          Text(recipe.title)
                      }
                  }
              }
              .padding()
          }
      }
}

#Preview {
    CategoryRecipes()
}
