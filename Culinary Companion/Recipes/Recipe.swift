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
    
    @State var rotation: Angle = .zero
      @State var pizza = Entity()
    
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Trader's Zest Pizza is a flavorful pizza featuring spicy pepperoni and fresh arugula and other ingredients from Trader Joe's, layered on a crispy crust with tangy tomato sauce and melty mozzarella. This delightful combination offers a perfect balance of meaty richness and peppery freshness, making it a quick and tasty meal option.")
                        .padding(.bottom, 16)
                    
                    HStack {
//                        Toggle("View It", isOn: $showImmersiveSpace)
//                            .toggleStyle(.button)
//                            .font(.headline)
                        Button("View It") {
                            openWindow(id: "Pizza")
                        }
                        NavigationLink(destination: RecipeIngredients(item: item)) {
                            Text("Ingredients")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        NavigationLink(destination: RecipeSteps(item: item)) {
                            Text("Make It!")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }

                Image("pizza")
                    .resizable()
                    .scaledToFit()
                //                    .frame(width: 225, height: 225)
                    .padding(32)
            }
            
            
                        Model3D(named: "Scene", bundle: realityKitContentBundle)
                            .padding(.bottom, 50)
            
            
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
