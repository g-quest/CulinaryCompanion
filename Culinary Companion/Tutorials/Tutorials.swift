//
//  Tutorials.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 12/6/23.
//

import SwiftUI

struct Tutorials: View {
    
    let tutorials = ["Home Gardening for Cooking", "Cutting Techniques", "Food Presentation and Plating", "Baking Fundamentals", "Preservation Techniques", "Mixology and Beverage Making", "Food Safety and Handling", "Nutrition and Diet", "Cooking for Special Occasions"]
    let tutorialImages = ["garden", "knives", "plating", "baking", "preservation", "mixology", "safety", "nutrition", "occasions"]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 24), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(tutorials.indices, id: \.self) { index in
                        let tutorial = tutorials[index]
                        let image = (index < tutorialImages.count) ? tutorialImages[index] : "defaultImage" // Fallback image if not enough images
                        
                        ZStack {
                            Image(image)
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
                            Text(tutorial)
                                .font(.title)
                                .frame(width: 190, height: 200, alignment: .center)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .padding()
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 32)
                .padding([.leading, .trailing], 32)
            }
            .navigationBarTitle("Tutorials")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// Make sure to define the Recipe view or the destination view for the NavigationLink.


#Preview {
    Tutorials()
}
