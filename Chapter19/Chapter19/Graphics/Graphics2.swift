//
//  Graphics2.swift
//  Chapter19
//

import SwiftUI

struct Graphics2: View {
    let color: Color = Color(
        red: 253 / 255, green: 176 / 255, blue: 174 / 255)

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 220)

            Circle()
                .fill(.white)
                .frame(width: 200)
        }
    }
}

struct Graphics2_Previews: PreviewProvider {
    static var previews: some View {
        Graphics2()
    }
}
