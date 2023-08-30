//
//  SwiftUIColor.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor7: View {
    private var colors: Gradient = Gradient(colors: [.white, .green])

    var body: some View {
        Circle()
            .fill(
                RadialGradient(
                    gradient: colors,
                    center: .center,
                    startRadius: 1,
                    endRadius: 200
                )
            )
            .padding(100)
    }
}

struct SwiftUIColor7_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor7()
    }
}
