//
//  SwiftUIStepperView.swift
//  Chapter11
//

import SwiftUI

struct SwiftUIStepperView: View {
    @State private var textSize = 0

    var body: some View {
        Form {
            Stepper(
                "字号: \(textSize)",
                value: $textSize,
                in: 12 ... 72,
                step: 1
            )
        }
    }
}

struct SwiftUIStepperView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStepperView()
    }
}
