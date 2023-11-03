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
            Text("Apple cinnamon muffins are a soft pastry filled with apple chunks, enhanced by aromatic cinnamon. They evoke feelings of a cozy autumn with their spicy scent and sweet apple flavor. With a crisp exterior and moist interior, some versions feature a streusel topping or caramel drizzle. Ideal for any meal or snack, these muffins pair well with coffee or tea, offering comfort and warmth any time of the year.")
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.top, 50)
//            Image("apple-muffins-1")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 225, height: 225)
//                .padding()

            
            HStack {
                Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                    .toggleStyle(.button)
                    .padding(.top, 50)
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
