//
//  SwiftLanguage2.swift
//  Chapter5
//

import SwiftUI

struct SwiftLanguage2: View {
    var body: some View {
        VStack(spacing:10) {
            TextDemo2(text: "良辰吉日时时有，")
            TextDemo2(text: "锦瑟年年岁岁拥。")
        }
    }
}

// MARK: - 文字组件

struct TextDemo2: View {
    var text: String

    var body: some View {
        Text(text)
    }
}

struct SwiftLanguage2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLanguage2()
    }
}
