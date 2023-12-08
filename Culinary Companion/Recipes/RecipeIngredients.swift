//
//  RecipeIngredients.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/24/23.
//

import SwiftUI

struct RecipeIngredients: View {
    
    var item: String
    
    let data = [
        ("Ingredient", "Amount", "In Fridge"),
        ("Pre-made pizza dough", "1 Bag", "yes"),
        ("Pizza Sauce", "1/2 Cup", "yes"),
        ("Mozzarella Cheese", "1 1/2 Cup", "yes"),
        ("Pepperoni", "1/2 Cup", "yes"),
        ("Arugula", "1 Cup", "yes"),
        ("Red Pepper Flakes", "As desired", "no"),
        ("Grated Parmesan Cheese", "As desired", "no"),
    ]
    
    var body: some View {
        
        List(data.indices, id: \.self) { index in
            HStack {
                Text(data[index].0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(index == 0 ? .title : .body)
                Text(data[index].1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(index == 0 ? .title : .body)
                
                if data[index].2 == "yes" {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                } else if data[index].2 == "In Fridge" {
                    Text("In Fridge").font(.title)
                } else {
                    Image(systemName: "cart.badge.plus")
                        .font(.title)
                }
            }
        }
        .padding(.top, 25)
        .padding([.leading, .trailing],50)
    };
}

#Preview {
    RecipeIngredients(item: "Apple Pie")
}

