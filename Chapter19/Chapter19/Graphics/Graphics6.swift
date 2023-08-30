//
//  Graphics6.swift
//  Chapter19
//

import SwiftUI

struct Graphics6: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)

            Rectangle()
                .fill(.white)
                .frame(width: 300, height: 200)
        }
    }
}

struct Graphics6_Previews: PreviewProvider {
    static var previews: some View {
        Graphics6()
    }
}
