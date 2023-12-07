//
//  RecipeIngredients.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/24/23.
//

import SwiftUI

struct RecipeIngredients: View {
    
    var item: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("- 1 cup Cornflakes Cereal")
                    Text("- 1 cup Milk of Choice")
//                    Text("- 2 cups all-purpose flour")
//                    Text("- 1 1/2 teaspoons baking powder")
//                    Text("- 1/2 teaspoon baking soda")
//                    Text("- 1/2 teaspoon salt")
//                    Text("- 2 teaspoons ground cinnamon")
//                    Text("- 1/2 cup unsalted butter, softened")
//                    Text("- 1 cup granulated sugar")
//                    Text("- 2 large eggs")
//                    Text("- 1 teaspoon pure vanilla extract")
//                    Text("- 1/2 cup milk")
//                    Text("- 1 1/2 cups diced apples (about 2 medium-sized apples, peeled and cored)")
//                    // Topping
//                    Text("Topping (optional):")
//                        .font(.title2)
//                        .padding(.top, 20)
//                    Text("- 3 tablespoons granulated sugar")
//                    Text("- 1/2 teaspoon ground cinnamon")
                }
            }
            .padding(20)
            
        }.navigationBarTitle("\(item) Ingredients", displayMode: .inline)
    };
}

#Preview {
    RecipeIngredients(item: "Apple Pie")
}
