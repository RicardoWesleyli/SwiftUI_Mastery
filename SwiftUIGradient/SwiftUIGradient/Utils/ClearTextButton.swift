//
//  ClearTextButton.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
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
                .padding(.trailing, 1)
            }
        }
    }
}

