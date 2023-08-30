//
//  SwiftUIColor4.swift
//  Chapter15
//

import SwiftUI

struct SwiftUIColor4: View {
    private var bgColor: Color = .red

    var body: some View {
        Rectangle()
            .fill(bgColor)
            .frame(maxWidth: .infinity, maxHeight: 200)
            .cornerRadius(16)
            .padding()

            // 第一层背景
            .background(.orange)
            .cornerRadius(16)
            .padding()

            // 第二层背景
            .background(.yellow)
            .cornerRadius(16)
            .padding()
    }
}

struct SwiftUIColor4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColor4()
    }
}
