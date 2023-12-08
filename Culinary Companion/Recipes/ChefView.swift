//
//  ChefRecipes.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 12/7/23.
//

import SwiftUI
import AVKit

struct ChefRecipe {
    var title: String
    var imageName: String
}


struct ChefView: View {
    @Environment(\.openWindow) private var openWindow
    
    let recipes = [
        ChefRecipe(title: "Apple Muffins", imageName: "apple-muffins-1"),
        ChefRecipe(title: "Chicken Curry", imageName: "apple-muffins-1"),
        
    ]
    
    // Grid layout configuration
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        
        HStack(spacing: 20) {
            // Chef's bio on the left
            VStack(alignment: .leading) {
                Text("Chef's Name")
                    .font(.title)
                    .bold()
                Text("Short Bio of the Chef...")
                    .font(.body)
                Button("Watch Video") {
                       openWindow(id: "RamsayVideo")
                }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Text("Top Dishes")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                .frame(minWidth: 0, maxWidth: .infinity)
            }

        }
        .padding()
    }
}

#Preview {
    ChefView()
}
