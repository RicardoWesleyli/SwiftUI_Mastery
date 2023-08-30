//
//  SwiftLanguage5.swift
//  Chapter5
//

import SwiftUI

struct SwiftLanguage5: View {
    var isLogin: Bool = true
    var text: String = "人生得意须尽欢，莫使金樽空对月。"

    var body: some View {
        if isLogin && text.count > 0 {
            Text(text)
        } else {
            Text("网络似乎出了点问题，请稍后再试～")
        }
    }
}

struct SwiftLanguage5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLanguage5()
    }
}
