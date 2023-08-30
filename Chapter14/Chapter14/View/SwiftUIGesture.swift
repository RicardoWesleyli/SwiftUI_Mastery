//
//  SwiftUIGesture.swift
//  Chapter14
//

import SwiftUI

struct SwiftUIGesture: View {
    @GestureState private var scalingRatio = CGFloat(1.0)
    @State private var lastRatio = CGFloat(1.0)
    @State private var lastAngle = Angle(degrees: 0.0)

    var body: some View {
        Image("BannerImage3")
            .resizable()
            .scaledToFit()
            .frame(width: 180)
            .clipShape(Circle())

            // 缩放
            .scaleEffect(scalingRatio * lastRatio)

            // 旋转
            .rotationEffect(lastAngle)

            // 手势修饰符
            .gesture(
                magnificationGesture.simultaneously(with: rotationGesture)
            )
    }

    // 缩放手势
    var magnificationGesture: some Gesture {
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
    }

    // 旋转手势
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { finalAngle in
                self.lastAngle = finalAngle
            }
    }
}

struct SwiftUIGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGesture()
    }
}
