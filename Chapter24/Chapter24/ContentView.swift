//
//  ContentView.swift
//  Chapter24
//

import SwiftUI

struct ContentView: View {
    @State private var isOpen = false

    var body: some View {
        Toggle(isOn: $isOpen) {
            Image(systemName: isOpen ? "power.circle.fill" : "power.circle")
                .font(.system(size: 68))
        }
        .tint(.green)
        .toggleStyle(.button)
        .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
