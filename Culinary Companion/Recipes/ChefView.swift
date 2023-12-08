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
    var recipes = ["c1", "c2", "c3"]
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                HStack(spacing: 0) {
                    VStack(alignment: .center) {
                        Image("gramsay")
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .clipped()
                            .padding()
                            .frame(width: 225, height: 225)
                        
                        
                    }
                    
                    Text("Gordon James Ramsay is a British celebrity chef, restaurateur, television presenter, and writer. His restaurant group, Gordon Ramsay Restaurants, was founded in 1997 and has been awarded seventeen Michelin stars overall and currently holds seven. After rising to fame on the British television miniseries Boiling Point in 1999, Ramsay became one of the best-known and most influential chefs in the world.")
                        .font(.body)
                }
                .padding([.leading, .trailing], 16)
              
                
                
                Section(header: Text("Upcoming Events")
                    .font(.title)) {
                        HStack() {
                            VStack {
                                Text("12/9/2023 | Chef Ramsay's Immersive Master Class")
                                    .font(.title2)
                                    .multilineTextAlignment(.center)
                                Text("Join the chef himself as he takes a deep dive on what it takes to make the perfect dish.")   
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(20)
                                Button("Watch Preview") {
                                    openWindow(id: "RamsayVideo")
                                }
                                .padding(.top, 16)
                            }
                            
                            Image("preview")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(16)
                            
                        }
                        .padding(20)
                        .border(Color.gray, width: 1)
                    }
                    .padding(.top, 32)
                
                Section(header: Text("Featured Recipes")
                    .font(.title)) {
                        VStack {
                            ScrollView {
                                LazyVGrid(columns: columns, spacing: 5) {
                                    ForEach(recipes, id: \.self) { item in
                                        Image(item)
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fill)
                                            .clipped()
                                    }
                                }
                            }
                            Button("View More") {
                                
                            }
                            .padding([.top, .bottom], 16)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.top, 32)
                    .padding([.leading, .trailing], 100)
                
                
            }
            .navigationBarTitle("Gordon Ramsay")
            .padding([.leading, .trailing], 100)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ChefView()
}
