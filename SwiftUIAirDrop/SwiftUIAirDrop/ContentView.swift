//
//  ContentView.swift
//  SwiftUIAirDrop
//
//  Created by Ricardo Li on 2022/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animateCircle = false

    var body: some View {
        ZStack {
            Image(systemName: "antenna.radiowaves.left.and.right.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)

            Circle()
                .stroke()
                .frame(width: 340, height: 340)
                .foregroundColor(.blue)
                .scaleEffect(animateCircle ? 1 : 0.3)
                .opacity(animateCircle ? 0 : 1)

            Circle()
                .stroke()
                .frame(width: 240, height: 240)
                .foregroundColor(.blue)
                .scaleEffect(animateCircle ? 1 : 0.3)
                .opacity(animateCircle ? 0 : 1)

            Circle()
                .stroke()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .scaleEffect(animateCircle ? 1 : 0.3)
                .opacity(animateCircle ? 0 : 1)
        }
        .onAppear {
            withAnimation(.easeIn(duration: 3).repeatForever(autoreverses: false)) {
                self.animateCircle.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
