//
//  SwiftUIColor.swift
//  Chapter15
//
//  Created by Ricardo Li on 2023/8/29.
//

import SwiftUI

struct SwiftUIColor: View {
    private var colors: Gradient = Gradient(colors:
        [Color.Hex(0x8FD3F4), Color.Hex(0x84FAB0)]
    )

    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .padding()
    }
}
// 十六进制颜色值拓展
extension Color {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> Color {
        return Color(red: red / 255, green: green / 255, blue: blue / 255)
    }
    static func Hex(_ hex: UInt) -> Color {
        let r: CGFloat = CGFloat((hex & 0xFF0000) >> 16)
        let g: CGFloat = CGFloat((hex & 0x00FF00) >> 8)
        let b: CGFloat = CGFloat(hex & 0x0000FF)
        return rgb(r, green: g, blue: b)
    }
}

struct SwiftUIColor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor()
    }
}
