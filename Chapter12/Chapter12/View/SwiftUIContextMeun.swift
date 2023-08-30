//
//  SwiftUIContextMeun.swift
//  Chapter12
//

import SwiftUI

struct SwiftUIContextMeun: View {
    @State private var text: String = "你逆光而来，配得上这世间所有的温柔。"

    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            // 点按弹窗
            .contextMenu {
                Button("复制文字") {
                    // 复制文字到剪切版
                    UIPasteboard.general.string = text
                }
            }
    }
}

struct SwiftUIContextMeun_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIContextMeun()
    }
}
