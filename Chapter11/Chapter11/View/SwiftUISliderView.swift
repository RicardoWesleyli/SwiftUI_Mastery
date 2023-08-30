//
//  SwiftUISliderView.swift
//  Chapter11
//

import SwiftUI

struct SwiftUISliderView: View {
    @State private var textSize: CGFloat = 0

    var body: some View {
        Form {
            Slider(
                value: $textSize,
                in: 12 ... 72,
                step: 1
            )
        }
    }
}

struct SwiftUISliderView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISliderView()
    }
}
