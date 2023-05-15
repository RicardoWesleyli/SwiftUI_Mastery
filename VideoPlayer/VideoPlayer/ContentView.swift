//
//  ContentView.swift
//  VideoPlayer
//
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        VStack {
            videoPlayerView
            descriptionTextView
        }
    }

    // 播放视频窗口
    private var videoPlayerView: some View {
        ZStack{
            PlayerView()
                .aspectRatio(contentMode: .fit)
                .frame(width: 315)
            
            Image("iPhone")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }

    // 说明文字
    private var descriptionTextView: some View {
        VStack(alignment: .leading, spacing: 10) {
            DescriptionText(item: 1, description: "轻点并按住主屏幕的任意位置")
            DescriptionText(item: 2, description: "轻点左上角的“+”按钮")
            DescriptionText(item: 3, description: "向下滑动并轻点应用，点击添加小组件")
        }
        .padding()
    }
}

// 说明文字组件
struct DescriptionText: View {
    var item: Int
    var description: String

    var body: some View {
        HStack(spacing: 15) {
            Text(String(item))
                .font(.system(size: 14))
                .bold()
                .foregroundColor(Color(.systemGray2))
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(Circle())

            Text(description)
                .font(.system(size: 17))
                .foregroundColor(Color(.systemGray2))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
