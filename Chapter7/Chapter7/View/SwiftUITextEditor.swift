//
//  SwiftUITextEditor.swift
//  Chapter7
//

import SwiftUI

struct SwiftUITextEditor: View {
    @State var inputText: String = ""

    var body: some View {
        ZStack(alignment: .topLeading) {
            // 多行文本框
            TextEditor(text: $inputText)
                .padding()
            // 提示文字
            if inputText.isEmpty {
                Text("请输入内容")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(25)
            }
        }
        // 边框
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(UIColor.placeholderText), lineWidth: 1)
        )
        .padding()
        .frame(height: 320)
    }
}

struct SwiftUITextEditor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextEditor()
    }
}
