//
//  Community.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 12/6/23.
//

import SwiftUI

struct Community: View {
    let friendsImages = ["c1", "c2", "c3", "c4"]
    let communityImages = ["c5", "c6", "c7", "c8", "c9", "c10", "c11", "c12", "c13", "c14", "c15", "c16", "c17", "c18", "c19", "c20"]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 4)

    var body: some View {
        NavigationView {
            ScrollView{
                Section(header: Text("Latest Dishes from Friends")
                                    .font(.title2)) {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(friendsImages, id: \.self) { item in
                                Image(item)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                                    .clipped()
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                        .padding([.leading, .trailing], 32)
                    }
                }
                Section(header: Text("Discover Something New")
                                    .font(.title2)) {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(communityImages, id: \.self) { item in
                                Image(item)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                                    .clipped()
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                        .padding([.leading, .trailing], 32)
                    }
                }
            }
            .navigationBarTitle("Community")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    Community()
}
