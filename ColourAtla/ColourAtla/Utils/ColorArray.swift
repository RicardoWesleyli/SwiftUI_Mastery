//
//  ColorArray.swift
//  ColourAtla
//
//  Created by Ricardo Li on 2022/7/8.
//

import SwiftUI

func HexToRGB(colors: [String]) -> [Color] {
    var colors1 = [Color]()

    for color in colors {
        // Remove #
        var trimmed = color.trimmingCharacters(in: .whitespaces).uppercased()
        trimmed.remove(at: trimmed.startIndex)

        var hexValue: UInt64  = 0
        Scanner(string: trimmed).scanHexInt64(&hexValue)

        let r = CGFloat((hexValue & 0x00FF0000) >> 16) / 255
        let g = CGFloat((hexValue & 0x0000FF00) >> 8) / 255
        let b = CGFloat((hexValue & 0x000000FF)) / 255
        colors1.append(Color(UIColor(red: r, green: g, blue: b, alpha: 1.0)))
    }

    return colors1
}

