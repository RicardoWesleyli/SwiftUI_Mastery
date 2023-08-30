//
//  Graphics9.swift
//  Chapter19
//

import SwiftUI

struct Graphics9: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)

            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 300, height: 200)
        }
    }
}

struct Graphics9_Previews: PreviewProvider {
    static var previews: some View {
        Graphics9()
    }
}
