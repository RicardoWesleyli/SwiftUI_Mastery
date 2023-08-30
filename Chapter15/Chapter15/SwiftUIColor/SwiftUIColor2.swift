//
//  SwiftUIColor2.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor2: View {
    private var imageColor: Color = Color("imageColor")
    private var textColor: Color = .green

    var body: some View {
        VStack(spacing: 40) {
            Image(systemName: "heart.fill")
                .foregroundColor(imageColor)

            Text("纵使晴明无雨色，入云深处亦沾衣。")
                .foregroundColor(textColor)
        }
    }
}

struct SwiftUIColor2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor2()
    }
}
