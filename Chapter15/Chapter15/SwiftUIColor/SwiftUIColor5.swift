//
//  SwiftUIColor5.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor5: View {
    private var textColor: Color = .green

    var body: some View {
        Text("微信登录")
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, maxHeight: 48)
//            .overlay(
//                RoundedRectangle(cornerRadius: 30)
//                    .stroke(textColor, lineWidth: 1)
//            )
            .overlay(
                Capsule(style: .continuous)
                    .stroke(
                        textColor,
                        style: StrokeStyle(lineWidth: 2, dash: [10])
                    )
            )
            .padding(.horizontal, 40)
    }
}

struct SwiftUIColor5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor5()
    }
}
