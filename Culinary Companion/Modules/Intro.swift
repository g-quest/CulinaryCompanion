//
//  Intro.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/23/23.
//

import SwiftUI

struct Intro: View {
    var body: some View {
        GeometryReader{ geo in
              ZStack {
                  BGVideo()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: geo.size.width, height: geo.size.height)
                      .overlay(Color.black.opacity(0.4))
                      .edgesIgnoringSafeArea(.all)

                  VStack{
                      Spacer()
                      Image("logo")
                           .resizable()
                           .scaledToFit()
                           .frame(width: 500, height: 500)
                           .colorInvert()
//                      Text("Your Personal Guide to Amazing Dishes")
//                          .font(.subheadline)
                      Spacer()
                  }
              }
          }
    }
}

#Preview {
    Intro()
}
