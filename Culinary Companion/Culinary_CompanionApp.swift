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
        
        WindowGroup(id: "OvenTimer") {
            OvenTimer()
        }
        .defaultSize(CGSize(width: 500, height: 500))
        
        WindowGroup(id: "RamsayVideo") {
            RamsayVideo()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
        .immersionStyle(selection: $recipeImmersionStyle, in: .mixed)
    }
}
