//
//  SwiftUIGesture5.swift
//  Chapter14
//

import SwiftUI

struct SwiftUIGesture5: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero

    var body: some View {
        Text("我曾踏月而来，只因你在山中。")
            .font(.system(size: 20))

            // 偏移量
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)

            // 动画效果
            .animation(.easeInOut, value: dragOffset)

            // 手势修饰器
            .gesture(
                // 拖拽手势
                DragGesture()

                    // 拖拽时
                    .updating($dragOffset, body: { value, state, _ in
                        state = value.translation
                    })

                    // 拖拽结束时
                    .onEnded({ value in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    })
            )
    }
}

struct SwiftUIGesture5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGesture5()
    }
}
