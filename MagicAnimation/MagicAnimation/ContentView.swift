//
//  ContentView.swift
//  MagicAnimation
//
//  Created by Ricardo Li on 2022/7/30.
//

import SwiftUI

struct ContentView: View {
    @State var isSwitch: Bool = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        HStack {
            ForEach(0 ..< 8) { num in
                Image(systemName: isSwitch ? "heart.circle.fill" : "heart.circle")
                    .font(.system(size: 32))
                    .foregroundColor(isSwitch ? .red : .purple)
                    .offset(self.dragAmount)
                    .animation(
                        Animation.default.delay(Double(num) / 20), value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.isSwitch.toggle()
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
