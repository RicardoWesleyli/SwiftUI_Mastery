//
//  SloganTextView.swift
//  Chapter5
//

import SwiftUI

struct SloganTextView: View {
    var body: some View {
        VStack(spacing: 10) {
            TextDemo(text: "你好，世界。", textSize: 23, textColor: .black)
            TextDemo(text: "愿日子如熹光，愿你能幸福～", textSize: 17, textColor: .gray)
        }
    }
}

// MARK: - 文字组件

struct TextDemo: View {
    var text: String
    var textSize: CGFloat
    var textColor: Color

    var body: some View {
        Text(text)
            .font(.system(size: textSize))
            .foregroundColor(textColor)
    }
}

struct SloganTextView_Previews: PreviewProvider {
    static var previews: some View {
        SloganTextView()
    }
}
