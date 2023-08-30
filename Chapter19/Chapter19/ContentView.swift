//
//  ContentView.swift
//  Chapter19
//

import SwiftUI

struct ContentView: View {
    var lineWidth: CGFloat = 30.0
    var startAngle: Double = -90.0
    let startColor: Color = Color(
        red: 249 / 255, green: 194 / 255, blue: 235 / 255)
    let endColor: Color = Color(
        red: 169 / 255, green: 193 / 255, blue: 238 / 255)
    
    @State var progress: Double = 0.7

    var body: some View {
        ZStack {
            Circle().stroke(Color(.systemGray6), lineWidth: lineWidth)

            RingShape(progress: progress, lineWidth: lineWidth)
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [startColor, endColor]),
                        center: .center,
                        startAngle: .degrees(startAngle),
                        endAngle: .degrees(360 * progress + startAngle))
                )
        }
        .frame(width: 300)
    }
}

// 自定义圆环
struct RingShape: Shape {
    var progress: Double = 0.0
    var lineWidth: CGFloat = 30.0
    var startAngle: Double = -90.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2.0, y: rect.height / 2.0)
        let radius = min(rect.width, rect.height) / 2.0
        let sAngle = Angle(degrees: startAngle)
        let eAngle = Angle(degrees: 360 * progress + startAngle)
        let clockwise = false

        path.addArc(
            center: center,
            radius: radius,
            startAngle: sAngle,
            endAngle: eAngle,
            clockwise: clockwise
        )

        return path.strokedPath(.init(lineWidth: lineWidth, lineCap: .round))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
