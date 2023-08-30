//
//  Graphics14.swift
//  Chapter19
//

import SwiftUI

struct Graphics14: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 50))
            let endPoint = CGPoint(x: 250, y: 50)
            let controlPoint1 = CGPoint(x: 150, y: 150)
            let controlPoint2 = CGPoint(x: 150, y: -50)
            path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)
        }
        .stroke(color, lineWidth: 4)
    }
}

struct Graphics14_Previews: PreviewProvider {
    static var previews: some View {
        Graphics14()
    }
}
