//
//  SwiftUIStyle4.swift
//  Chapter24
//

import SwiftUI

struct SwiftUIStyle4: View {
    var body: some View {
        VStack(spacing: 32) {
            // 唱片图片
            Image("Record")
                .resizable()
                .aspectRatio(contentMode: .fit)
            // 操作台
            Text("立即使用")
                .borderStyle()
        }
        .borderStyle()
    }
}

// 视图修饰符拓展
extension View {
    func borderStyle() -> some View {
        modifier(BorderStyle())
    }
}

// 按钮修饰符
struct BorderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .padding(.horizontal)
            .padding(.bottom)
    }
}


struct SwiftUIStyle4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStyle4()
    }
}
