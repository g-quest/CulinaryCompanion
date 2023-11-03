//
//  Culinary_CompanionApp.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 11/3/23.
//

import SwiftUI

@main
struct Culinary_CompanionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
