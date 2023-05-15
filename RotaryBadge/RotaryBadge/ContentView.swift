//
//  ContentView.swift
//  RotaryBadge
//
//  Created by Ricardo Li on 2022/7/30.
//

import SwiftUI

struct ContentView: View {
    @State var animation = 0.0

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)

            Image("juejin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 5)
                )
                .shadow(radius: 20)
                .rotation3DEffect(.degrees(animation), axis: (x: 0, y: 1, z: 0.2))
                .onTapGesture {
                    withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)) {
                        self.animation += 360
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
