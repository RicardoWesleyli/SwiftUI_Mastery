//
//  SwiftUIAnimations6.swift
//  Chapter25
//

import SwiftUI

struct SwiftUIAnimations6: View {
    @State var isLoading: Bool = false

    var body: some View {
        ZStack {
            // 背景外环
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 8)
                .frame(width: 48, height: 48)

            // 加载进度条
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color.green, lineWidth: 4)
                .frame(width: 48, height: 48)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 0.6)
                    .repeatForever(autoreverses: false),
                    value: isLoading
                )
        }
        .onAppear {
            self.isLoading = true
        }
    }
}

struct SwiftUIAnimations6_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimations6()
    }
}
