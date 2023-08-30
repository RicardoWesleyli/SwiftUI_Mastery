//
//  Graphics15.swift
//  Chapter19
//

import SwiftUI

struct Graphics15: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            let center = CGPoint(x: 200, y: 200)
            let radius: CGFloat = 150
            let startAngle = Angle(degrees: 0)
            let endAngle = Angle(degrees: 45)
            let clockwise = true
            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: clockwise
            )
            path.closeSubpath()
        }
        .stroke(color, lineWidth: 4)
    }
}

struct Graphics15_Previews: PreviewProvider {
    static var previews: some View {
        Graphics15()
    }
}
