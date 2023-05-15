//
//  ClearTextButton.swift
//  ColourAtla
//
//  Created by Ricardo Li on 2022/7/8.
//

import SwiftUI

struct ClearTextButton: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content

            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: Constants.clearButton)
                        .foregroundColor(Color.gray)
                }
                .padding(.leading, 1)
            }
        }
    }
}

