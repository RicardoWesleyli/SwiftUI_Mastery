//
//  Graphics4.swift
//  Chapter19
//

import SwiftUI

struct Graphics4: View {
    let color: Color = Color(
        red: 253 / 255, green: 176 / 255, blue: 174 / 255)

    var body: some View {
        Ellipse()
            .fill(color)
            .frame(width: 200, height: 100)
    }
}

struct Graphics4_Previews: PreviewProvider {
    static var previews: some View {
        Graphics4()
    }
}
