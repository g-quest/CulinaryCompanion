//
//  RamsayVideo.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 12/7/23.
//

import SwiftUI
import AVKit

struct RamsayVideo: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "gramsay", withExtension: "mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                player.play()
            }
    }
}

#Preview {
    RamsayVideo()
}
