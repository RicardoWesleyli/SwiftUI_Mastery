//
//  SwiftUIStyle3.swift
//  Chapter24
//

import SwiftUI

struct SwiftUIStyle3: View {
    var body: some View {
        VStack {
            Text("微信登录")
                .modifier(TextBtStyle())

            Text("Apple登录")
                .modifier(TextBtStyle())

            Text("手机号登录")
                .modifier(TextBtStyle())
        }
    }
}

// 按钮修饰符
struct TextBtStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
            )
            .padding(.horizontal)
    }
}


struct SwiftUIStyle3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStyle3()
    }
}
