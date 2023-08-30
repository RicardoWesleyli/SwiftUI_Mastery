//
//  SwiftUIStyle2.swift
//  Chapter24
//

import SwiftUI

struct SwiftUIStyle2: View {
    var body: some View {
        VStack {
            Spacer()
            TextBtnView(text: "微信登录", btnColor: .green)
            TextBtnView(text: "Apple登录", btnColor: .black)
            TextBtnView(text: "手机号码登录", btnColor: .blue)
        }
    }
}

// 文字按钮组件
struct TextBtnView: View {
    var text: String
    var btnColor: Color

    var body: some View {
        Text(text)
            .font(.system(size: 17))
            .foregroundColor(.white)
            .bold()
            .padding()
            .frame(maxWidth: .infinity,maxHeight: 56)
            .background(btnColor)
            .cornerRadius(32)
            .padding(.horizontal,60)
    }
}
struct SwiftUIStyle2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStyle2()
    }
}
