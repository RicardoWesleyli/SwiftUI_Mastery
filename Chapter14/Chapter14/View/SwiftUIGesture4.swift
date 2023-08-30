//
//  SwiftUIGesture4.swift
//  Chapter14
//

import SwiftUI

struct SwiftUIGesture4: View {
    @GestureState private var isLongPressGesture: Bool = false

    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: isLongPressGesture ? 38 : 32))
            .foregroundColor(isLongPressGesture ?.red : .gray)
            .frame(width: 100, height: 100)
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .scaleEffect(isLongPressGesture ? 1.2 : 1.0)

            // 手势修饰器
            .gesture(
                // 长按手势
                LongPressGesture(minimumDuration: 1.0)

                    // 长按时
                    .updating($isLongPressGesture, body: { currentState, state, _ in
                        state = currentState
                    })
                    // 长按结束
                    .onEnded({ _ in

                    })
            )
    }
}

struct SwiftUIGesture4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGesture4()
    }
}
