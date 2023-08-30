//
//  SwiftUIColor3.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor3: View {
    private var textColor: Color = .white
    private var textbgColor: Color = .green

    var body: some View {
        Text("微信登录")
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(textbgColor)
            .cornerRadius(8)
            .padding(.horizontal, 40)
    }
}

struct SwiftUIColor3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor3()
    }
}
