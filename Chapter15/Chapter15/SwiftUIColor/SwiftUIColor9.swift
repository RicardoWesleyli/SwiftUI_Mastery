//
//  SwiftUIColor9.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor9: View {
    private var colors: Gradient = Gradient(colors: [.white, .red])

    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 72))
            .foregroundStyle(
                LinearGradient(
                    gradient: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
    }
}

struct SwiftUIColor9_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor9()
    }
}
