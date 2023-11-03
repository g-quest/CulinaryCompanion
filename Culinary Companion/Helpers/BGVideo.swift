//
//  BGVideo.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/23/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct BGVideo: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BGVideo>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let fileUrl = Bundle.main.url(forResource: "intro-bg", withExtension: "mp4") else {
            fatalError("Video file not found.")
        }
        
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

#Preview {
    BGVideo()
}
