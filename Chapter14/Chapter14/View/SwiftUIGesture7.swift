//
//  SwiftUIGesture7.swift
//  Chapter14
//

import SwiftUI

struct SwiftUIGesture7: View {
    @State private var lastAngle = Angle(degrees: 0.0)

    var body: some View {
        Image("BannerImage3")
            .resizable()
            .scaledToFit()
            .frame(width: 180)
            .clipShape(Circle())

            // 旋转
            .rotationEffect(lastAngle)

            // 手势修饰符
            .gesture(
                // 旋转手势
                RotationGesture()
                    .onChanged { finalAngle in
                        self.lastAngle = finalAngle
                    }
            )
    }
}

struct SwiftUIGesture7_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGesture7()
    }
}
