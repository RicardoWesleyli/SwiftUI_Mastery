//
//  Graphics7.swift
//  Chapter19
//

import SwiftUI

struct Graphics7: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)

            Rectangle()
                .strokeBorder(.white, style: StrokeStyle(lineWidth: 4, dash: [10]))
                .frame(width: 300, height: 200)
        }
    }
}

struct Graphics7_Previews: PreviewProvider {
    static var previews: some View {
        Graphics7()
    }
}
