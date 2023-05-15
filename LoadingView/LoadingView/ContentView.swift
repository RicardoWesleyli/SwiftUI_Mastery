//
//  ContentView.swift
//  LoadingView
//
//  Created by Ricardo Li on 2022/8/15.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimation: Bool = false

    var body: some View {
        VStack(spacing:40) {
            fourDotsLoading()
            musicLoading()
        }

        .onAppear {
            self.isAnimation.toggle()
        }
    }

    // 4个圆点加载
    func fourDotsLoading() -> some View {
        HStack {
            ForEach(0 ..< 4) { index in
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                    .scaleEffect(isAnimation ? 1.0 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.5)
                        .repeatForever()
                        .delay(Double(index) * 0.2))
            }
        }
    }

    // 音乐起伏加载
    func musicLoading() -> some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(0 ..< 5) { index in
                Capsule(style: .continuous)
                    .fill(Color.green)
                    .frame(width: 10, height: 50)
                    .scaleEffect(isAnimation ? 0.5 : 1.0)
                    .animation(Animation.easeInOut(duration: 0.5)
                        .repeatForever()
                        .delay(Double(index) * 0.1)
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
