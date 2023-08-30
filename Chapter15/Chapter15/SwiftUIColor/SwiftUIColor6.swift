//
//  SwiftUIColor6.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor6: View {
    private var colors: Gradient = Gradient(colors: [.orange,.red,.purple])

    var body: some View {
        Text("立即使用")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(
                LinearGradient(
                    gradient: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(32)
            .padding(.horizontal, 40)
    }
}

struct SwiftUIColor6_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor6()
    }
}
