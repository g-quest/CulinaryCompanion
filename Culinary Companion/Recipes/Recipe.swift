//
//  Recipe.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/28/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Recipe: View {
    var item: String
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            Text("Indulge in the simple joy of Maize Munchies, the cereal that brings the authentic, golden goodness of the fields to your breakfast bowl. Toasted to a perfect crunch and sweetened with just a hint of nature's own sugars, our flakes offer a pure, hearty start to your day. With no artificial additives, each spoonful is a clean, guilt-free delight, ideal for a quick breakfast or an energizing snack. Dive into the down-to-earth flavor of Maize Munchies, and turn every meal into a celebration of life's natural bounty.")
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)
//            Image("apple-muffins-1")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 225, height: 225)
//                .padding()

            
            HStack {
                Toggle("Interact", isOn: $showImmersiveSpace)
                    .toggleStyle(.button)
                    .font(.headline)
                NavigationLink(destination: RecipeIngredients(item: item)) {
                    Text("See Ingredients")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                NavigationLink(destination: RecipeSteps(item: item)) {
                    Text("See Cooking Steps")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .navigationBarTitle(item, displayMode: .inline)
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview {
    Recipe(item: "Apple Pie")
}
