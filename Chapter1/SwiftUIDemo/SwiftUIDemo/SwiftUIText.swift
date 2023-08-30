//
//  SwiftUIText.swift
//  SwiftUIDemo
//

import SwiftUI

struct SwiftUIText: View {
    var body: some View {
        Text("他居然记住了我无意间的话，这感觉很特别。")
            .font(.system(size:17))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct SwiftUIText_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIText()
    }
}
