//
//  ToastView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/7/1.
//

import SwiftUI

struct ToastViewModifier: ViewModifier {
    @Binding var present: Bool // 是否显示
    @Binding var message: String // 显示的文字
    // 显示在底部还是中间
    var alignment: Alignment = .center

    func body(content: Content) -> some View {
        ZStack {
            // 使用者
            content
                .zIndex(0)

            // Toast 内容
            VStack {
                Text(message)
                    .padding(Edge.Set.horizontal, 20)
                    .padding(Edge.Set.vertical, 10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .background(Color.gray.opacity(0.1))
            .opacity(present ? 1 : 0)
            .zIndex(1)
            .onChange(of: present) { value in
                if value {
                    // 延迟2秒消失
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        present.toggle()
                    }
                }
            }
        }
    }
}

extension View {
    func toast(present: Binding<Bool>, message: Binding<String>, alignment: Alignment = .center) -> some View {
        modifier(ToastViewModifier(present: present, message: message, alignment: alignment))
    }
}
