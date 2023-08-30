//
//  Graphics5.swift
//  Chapter19
//

import SwiftUI

struct Graphics5: View {
    let color: Color = Color(
        red: 253 / 255, green: 176 / 255, blue: 174 / 255)

    var body: some View {
        ZStack {
            Ellipse()
                .fill(color)
                .frame(width: 200, height: 100)

            Circle()
                .fill(Color.black)
                .frame(width: 80)

            Circle()
                .fill(Color.white)
                .frame(width: 20)
        }
    }
}

struct Graphics5_Previews: PreviewProvider {
    static var previews: some View {
        Graphics5()
    }
}
