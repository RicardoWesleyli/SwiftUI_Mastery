//
//  ContentView.swift
//  AVFoundationView
//
//

import SwiftUI

struct ContentView: View {
    @GestureState private var isPressed = false

    // 引入VM
    @StateObject var viewModel = ViewModel()

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
