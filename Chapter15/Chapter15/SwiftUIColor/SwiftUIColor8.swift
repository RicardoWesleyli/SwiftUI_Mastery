//
//  SwiftUIColor.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor8: View {
    private var colors: Gradient = Gradient(colors: [.white, .green])

    var body: some View {
        Circle()
            .fill(
                AngularGradient(
                    gradient: colors,
                    center: .center
                )
            )
            .padding(100)
    }
}

struct SwiftUIColor8_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor8()
    }
}
