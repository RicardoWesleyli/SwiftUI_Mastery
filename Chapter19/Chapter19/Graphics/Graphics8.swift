//
//  Graphics8.swift
//  Chapter19
//

import SwiftUI

struct Graphics8: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)

            Rectangle()
                .fill(.white)
                .frame(width: 300, height: 200)
                .cornerRadius(8)
        }
    }
}

struct Graphics8_Previews: PreviewProvider {
    static var previews: some View {
        Graphics8()
    }
}
