//
//  PlayerView.swift
//  VideoPlayer
//
//

import AVFoundation
import AVKit
import SwiftUI

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("加载失败")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        // 获取资源路径
        let fileUrl = Bundle.main.url(forResource: "widget", withExtension: "MP4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)

        // 初始化 player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspect
        layer.addSublayer(playerLayer)

        // 创建一个新的播放器循环器
        playerLooper = AVPlayerLooper(player: player, templateItem: item)

        // 开始播放
        player.play()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

