//
//  Graphics13.swift
//  Chapter19
//

import SwiftUI

struct Graphics13: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 50))
            let endPoint = CGPoint(x: 250, y: 50)
            let controlPoint = CGPoint(x: 150, y: 150)
            path.addQuadCurve(to: endPoint, control: controlPoint)
        }
        .stroke(color, lineWidth: 4)
    }
}

struct Graphics13_Previews: PreviewProvider {
    static var previews: some View {
        Graphics13()
    }
}
