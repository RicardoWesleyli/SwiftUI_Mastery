//
//  Graphics11.swift
//  Chapter19
//

import SwiftUI

struct Graphics11: View {
    let color: Color = Color(
        red: 77 / 255, green: 102 / 255, blue: 245 / 255)

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)

            ZStack {
                Capsule()
                    .fill(.white)
                    .frame(width: 300, height: 60)
                
                Text("点击登录")
                    .foregroundColor(color)
                    .bold()
            }
        }
    }
}

struct Graphics11_Previews: PreviewProvider {
    static var previews: some View {
        Graphics11()
    }
}
