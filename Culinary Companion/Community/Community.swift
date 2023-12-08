//
//  Community.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 12/6/23.
//

import SwiftUI

struct ImageItem: Identifiable {
    let id = UUID()
    let imageName: String
}

struct DetailView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct MosaicView: View {
    let images: [ImageItem] = [
        // Initialize with your image names
        ImageItem(imageName: "apple-muffins-1"),
        ImageItem(imageName: "apple-muffins-1"),
        ImageItem(imageName: "apple-muffins-1"),
        ImageItem(imageName: "apple-muffins-1"),        
        ImageItem(imageName: "apple-muffins-1"),
        ImageItem(imageName: "apple-muffins-1"),
        ImageItem(imageName: "apple-muffins-1"),
        ImageItem(imageName: "apple-muffins-1"),
        // Add more images as needed
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                    ForEach(images) { item in
                        NavigationLink(destination: DetailView(imageName: item.imageName)) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Community")
        }
    }
}

struct Community: View {
    var body: some View {
        MosaicView()
    }
}

#Preview {
    Community()
}
