//
//  Graphics16.swift
//  Chapter19
//

import SwiftUI

struct Graphics16: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        ZStack(alignment: .topTrailing) {
            PACMan().fill(color)
            Circle()
                .frame(width: 40)
                .padding(100)
                .padding(.trailing, 40)
        }
    }
}

// 自定义形状视图
struct PACMan: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: 200, y: 200)
        let radius: CGFloat = 150
        let startAngle = Angle(degrees: -15)
        let endAngle = Angle(degrees: 35)
        let clockwise = true
        path.move(to: CGPoint(x: 200, y: 200))
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        return path
    }
}

struct Graphics16_Previews: PreviewProvider {
    static var previews: some View {
        Graphics16()
    }
}
