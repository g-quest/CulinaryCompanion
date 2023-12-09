//
//  Culinary_CompanionApp.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/23/23.
//

import SwiftUI

@main
struct Culinary_CompanionApp: App {
    
    @State private var recipeImmersionStyle: ImmersionStyle = .mixed
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "Pizza") {
            RotatingModel(item: "pizza", size: 1000)
        }
        .windowStyle(.volumetric)
 
        WindowGroup(id: "Dough") {
            RotatingModel(item: "dough", size: 500)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "Sauce") {
            RotatingModel(item: "sauce", size: 500)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "Beer") {
            RotatingModel(item: "beer", size: 500)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "Cheese") {
            RotatingModel(item: "cheese", size: 500)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "Arugula") {
            RotatingModel(item: "arugula", size: 500)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "Pepperoni") {
            RotatingModel(item: "pepperoni", size: 500)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "OvenTimer") {
            OvenTimer()
        }
        .defaultSize(CGSize(width: 500, height: 500))
        
        WindowGroup(id: "RamsayVideo") {
            RamsayVideo()
        }

//        ImmersiveSpace(id: "ImmersiveSpace") {
//            ImmersiveView()
//        }
//        .immersionStyle(selection: $recipeImmersionStyle, in: .mixed)
    }
}
