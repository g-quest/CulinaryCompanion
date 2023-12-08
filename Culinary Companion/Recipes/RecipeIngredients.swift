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
        ("Ingredient", "Amount", "yes"),
        ("Pre-made pizza dough", "1 Bag", "yes"),
        ("Pizza Sauce", "1/2 Cup", "yes"),
        ("Mozzarella Cheese", "1 1/2 Cup", "yes"),
        ("Pepperoni", "1/2 Cup", "yes"),
        ("Arugula", "1 Cup", "yes"),
        ("Red Pepper Flakes", "As desired", "no"),
        ("Grated Parmesan Cheese", "As desired", "no"),
    ]
    
    var body: some View {
        
        List(data, id: \.0) { row in
            HStack {
                Text(row.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(row.1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if row.2 == "yes" {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                } else {
                    Image(systemName: "cart.badge.plus")
                        .font(.title)
                }
            }
        }
        .padding(.top, 25)
        .padding([.leading, .trailing],50)
        
        //        ScrollView {
        //
        //            List(data, id: \.0) { row in
        //                    HStack {
        //                        Text(row.0)
        //                            .frame(maxWidth: .infinity, alignment: .leading)
        //                        Text(row.1)
        //                            .frame(maxWidth: .infinity, alignment: .leading)
        //
        //                        if row.2 == "yes" {
        //                            Image(systemName: "checkmark.circle.fill")
        //                                   .font(.title)
        //                                   .foregroundColor(.green)
        //                        } else {
        //                            Image(systemName: "cart.badge.plus")
        //                                   .font(.title)
        //                        }
        //                    }
        //                }
        //
        //
        //        }.navigationBarTitle("\(item) Ingredients", displayMode: .inline)
    };
}

#Preview {
    RecipeIngredients(item: "Apple Pie")
}

