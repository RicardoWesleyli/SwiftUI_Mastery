//
//  ColorHexString.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import SwiftUI

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
