//
//  SwiftLanguage.swift
//  Chapter5
//

import SwiftUI

struct SwiftLanguage: View {
    // 参数为可选类型
    var name: String?

    var body: some View {
        Text(name ?? "文如秋雨")
    }
}

struct SwiftLanguage_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLanguage()
    }
}
