//
//  Graphics12.swift
//  Chapter19
//

import SwiftUI

struct Graphics12: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.closeSubpath()
        }
        .stroke(color, lineWidth: 4)
    }
}

struct Graphics12_Previews: PreviewProvider {
    static var previews: some View {
        Graphics12()
    }
}
