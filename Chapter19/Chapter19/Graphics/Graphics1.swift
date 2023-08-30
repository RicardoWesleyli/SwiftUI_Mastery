//
//  Graphics1.swift
//  Chapter19
//

import SwiftUI

struct Graphics1: View {
    let color: Color = Color(
        red: 253 / 255, green: 176 / 255, blue: 174 / 255)
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 200)
    }
}

struct Graphics1_Previews: PreviewProvider {
    static var previews: some View {
        Graphics1()
    }
}
