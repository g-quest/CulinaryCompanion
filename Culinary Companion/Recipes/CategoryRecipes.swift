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
    var category: String
    
    let recipes = [
        CategoryRecipe(title: "Trader's Zest Pizza", imageName: "pizza"),
        CategoryRecipe(title: "Cranberry Apple Salad", imageName: "salad"),
        CategoryRecipe(title: "Green Pozole", imageName: "pozole"),
        CategoryRecipe(title: "Turkey Chili", imageName: "chili"),
        CategoryRecipe(title: "Pumpkin Hummus", imageName: "hummus"),
        CategoryRecipe(title: "Mango Lime Parfait", imageName: "parfait"),
        CategoryRecipe(title: "Arepas", imageName: "arepas"),
        CategoryRecipe(title: "Tunisian Shakshuka", imageName: "shakshuka"),
    ]
    
    // Grid layout configuration
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(recipes, id: \.title) { recipe in
                        NavigationLink(destination: Recipe(item: recipe.title)) {
                            ZStack {
                                Image(recipe.imageName)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                                    .cornerRadius(10)
                                    .clipped()
                                    .overlay(
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .opacity(0.45)
                                            .cornerRadius(10)
                                    )
                                    .padding()
                                Text(recipe.title)
                                    .font(.title3)
                                    .frame(width: 190, height: 200, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                    .padding()
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.clear)
                    }
                }
                .padding()
            }
            .navigationBarTitle(category)
            .padding([.leading, .trailing], 32)

        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

#Preview {
    CategoryRecipes(category: "Easy Food")
}
