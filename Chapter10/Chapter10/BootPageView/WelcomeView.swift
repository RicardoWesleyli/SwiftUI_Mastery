//
//  WelcomeView.swift
//  Chapter10
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            TabView {
                WelcomeCardView(imageName: "welcome_image001", title: "文字收藏", description: "我的朋友不多，但每个都很不错，比如那个叫路灯的家伙，总是愿意等我和叶落。")
                WelcomeCardView(imageName: "welcome_image002", title: "合集分享", description: "真的没有每天悲伤，只是偶尔看不见光。")
                WelcomeCardView(imageName: "welcome_image003", title: "笔记记录", description: "今天是个好天气，你该出去走走，我在外面等你。")
                WelcomeCardView(imageName: "welcome_image004", title: "不言，不言", description: "玫瑰太贵了，用野草纪念我吧，遍地都是，生生不息。")
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))

            // 按钮
            startUseBtn
        }
    }

    // 开始使用按钮
    private var startUseBtn: some View {
        Button(action: {
            // 点击后的操作
        }) {
            Text("立即使用")
                .font(.system(size: 17))
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.green)
                .cornerRadius(16)
                .padding(.horizontal)
        }
    }
}

// 滑动卡片组件
struct WelcomeCardView: View {
    var imageName: String
    var title: String
    var description: String

    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280, height: 280)
            Text(title)
                .font(.system(.title2))
                .foregroundColor(.black)
            Text(description)
                .font(.system(.subheadline))
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
