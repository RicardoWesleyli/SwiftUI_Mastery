//
//  SwiftUIGesture6.swift
//  Chapter14
//

import SwiftUI

struct SwiftUIGesture6: View {
    @GestureState private var scalingRatio = CGFloat(1.0)
    @State private var lastRatio = CGFloat(1.0)

    var body: some View {
        Image("BannerImage3")
            .resizable()
            .scaledToFit()
            .frame(width: 180)
            .clipShape(Circle())
            .scaleEffect(scalingRatio * lastRatio)

            // 手势修饰符
            .gesture(
                // 缩放手势
                MagnificationGesture()

                    // 缩放时
                    .updating($scalingRatio, body: { currentState, gestureState, _ in
                        gestureState = currentState

                    })

                    // 缩放结束时
                    .onEnded({ finalScale in
                        lastRatio *= finalScale
                    })
            )
    }
}

struct SwiftUIGestur6e_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGesture6()
    }
}
