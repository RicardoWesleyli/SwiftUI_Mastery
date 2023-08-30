//
//  Graphics10.swift
//  Chapter19
//

import SwiftUI

struct Graphics10: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)

            Capsule()
                .fill(.white)
                .frame(width: 300, height: 60)
        }
    }
}

struct Graphics10_Previews: PreviewProvider {
    static var previews: some View {
        Graphics10()
    }
}
