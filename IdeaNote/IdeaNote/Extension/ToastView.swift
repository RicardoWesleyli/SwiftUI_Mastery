//
//  ToastView.swift
//  IdeaNote
//
//  Created by Ricardo Li on 2022/9/20.
//

import SwiftUI

struct ToastViewModifier: ViewModifier {
    @Binding var present: Bool
    @Binding var message: String
    var alignment: Alignment = .center

    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(0)
            VStack {
                Text(message)
                    .padding(Edge.Set.horizontal, 20)
                    .padding(Edge.Set.vertical, 10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .background(Color.gray.opacity(0.1))
            .opacity(present ? 1 : 0)
            .zIndex(1)
            .onChange(of: present) { value in
                if value {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        present.toggle()
                    }
                }
            }
        }
    }
}

extension View {
    func toast(present: Binding<Bool>, message: Binding<String>, alignment: Alignment = .center) -> some View {
        modifier(ToastViewModifier(present: present, message: message, alignment: alignment))
    }
}
