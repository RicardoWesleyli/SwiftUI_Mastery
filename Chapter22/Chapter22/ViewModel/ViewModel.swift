//
//  ViewModel.swift
//  Chapter22
//

import AVFoundation
import SwiftUI

class ViewModel: ObservableObject {
    // 创建播放器
    var soundPlayer: AVAudioPlayer?

    // 播放声音方法
    func playAudio(forResource: String, ofType: String) {
        let path = Bundle.main.path(forResource: forResource, ofType: ofType)!
        let url = URL(fileURLWithPath: path)

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            print("音频文件出现问题")
        }
    }
}
