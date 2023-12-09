//
//  RecipeIngredients.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/24/23.
//

import SwiftUI

struct RecipeIngredients: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var item: String

    
    let data = [
        ("Ingredient", "Amount", "In Fridge", "Pizza"),
        ("Pre-made pizza dough", "1 Bag", "yes", "Dough"),
        ("Pizza Sauce", "1/2 Cup", "yes", "Sauce"),
        ("Mozzarella Cheese", "1 1/2 Cup", "yes", "Cheese"),
        ("Pepperoni", "1/2 Cup", "yes", "Pepperoni"),
        ("Arugula", "1 Cup", "yes", "Arugula"),
        ("Red Pepper Flakes", "As desired", "no", ""),
        ("Grated Parmesan Cheese", "As desired", "no", ""),
        ("Beer", "As desired", "yes", "Beer"),
    ]
    
    var body: some View {
        
        List(data.indices, id: \.self) { index in
            HStack {
//                Text(data[index].0)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(index == 0 ? .title : .body)
                Button(data[index].0) {
                    openWindow(id: data[index].3)
                }
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

