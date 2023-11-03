//
//  ContentView.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 11/3/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {

        TabView(selection: $selectedTab) {
            Intro()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            Recipes()
                .tabItem {
                    Image(systemName: "book.pages.fill")
                    Text("Recipes")
                }
                .tag(1)
            
//            CommunityView()
//                .tabItem {
//                    Image(systemName: "globe")
//                    Text("Community")
//                }
//                .tag(2)
//            
//            FavoritesView()
//                .tabItem {
//                    Image(systemName: "bookmark")
//                    Text("Favorites")
//                }
//                .tag(3)
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
