//
//  AVFoundationView.swift
//  Chapter22
//

import SwiftUI

struct AVFoundationView: View {
    @GestureState private var isPressed = false
    @State var viewModel = ViewModel()

    var body: some View {
        ZStack {
            // 填充背景颜色
            Color.black.edgesIgnoringSafeArea(.all)

            // 展示木鱼
            Image("WoodFish")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 180, maxHeight: 180)

                // 缩放
                .scaleEffect(isPressed ? 0.9 : 1.0)

                // 点击手势
                .gesture(
                    LongPressGesture(minimumDuration: 0.1)
                        .updating($isPressed) { value, state, _ in
                            state = value
                            
                            // 播放声音
                            viewModel.playAudio(forResource: "dong", ofType: "mp3")
                        }
                )
        }
    }
}

struct AVFoundationView_Previews: PreviewProvider {
    static var previews: some View {
        AVFoundationView()
    }
}
