//
//  RecipesMainView.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 12/7/23.
//

import SwiftUI

struct RecipesMainView: View {
    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    let categories = ["Comfort Foods", "Healthy and Nutritious", "Vegetarian and Vegan", "Ethnic and Global Cuisines", "Quick and Easy Meals", "Desserts"]
    let popularChefs = ["Gordon Ramsey", "Rachael Ray", "Kristen Kish", "Marcus S.", "Guy Fieri", "Giada De L."]
    let popularChefsImages = ["gramsay", "rray","kkish", "ms", "gfieri", "gdl"]
    let savedRecipes = ["Baked Kale Chips", "Bibimbap","Pesto Pasta with Chicken", "Cinnamon Apple Muffins"]
    let savedRecipesImages = ["kale","bibimbap","pasta", "apple-muffins-1"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Categories")) {
                    ScrollView {
                        LazyVGrid(columns: gridLayout, spacing: 20) {
                            ForEach(categories, id: \.self) { category in
                                NavigationLink(destination: CategoryRecipes()) {
                                    Text(category)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.top, 35)
                    }}

                Section(header: Text("By Popular Chefs")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(Array(zip(popularChefs.indices, popularChefs)), id: \.0) { index, chef in
                                NavigationLink(destination: ChefView()) {
                                    ZStack {
                                        Image(popularChefsImages[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .cornerRadius(100)
                                            .overlay(
                                                Rectangle()
                                                    .foregroundColor(.black)
                                                    .cornerRadius(100)
                                                    .opacity(0.5)
                                            )
                                        VStack {
                                            Spacer()
                                            Text(chef)
                                                .padding(.bottom, 40)
                                        }
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                }
                
                Section(header: Text("Saved Recipes")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(Array(zip(savedRecipes.indices, savedRecipes)), id: \.0) { index, recipe in
                                NavigationLink(destination: Recipe(item: recipe)) {
                                    ZStack {
                                        Image(savedRecipesImages[index])
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fill)
                                            .frame(width: 200, height: 200)
                                            .cornerRadius(10)
                                            .clipped()
                                            .overlay(
                                                Rectangle()
                                                    .foregroundColor(.black)
                                                    .opacity(0.5)
                                                    .cornerRadius(10)
                                            )
                                        Text(recipe)
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
                    }
                }
                


                
            }
            .navigationBarTitle("Recipes")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    RecipesMainView()
}
