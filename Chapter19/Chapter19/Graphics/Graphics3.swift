//
//  Graphics3.swift
//  Chapter19
//

import SwiftUI

struct Graphics3: View {
    let color: Color = Color(
        red: 253 / 255, green: 176 / 255, blue: 174 / 255)

    var body: some View {
        Circle()
            .stroke(color,lineWidth: 8)
            .frame(width: 200)
    }
}

struct Graphics3_Previews: PreviewProvider {
    static var previews: some View {
        Graphics3()
    }
}
