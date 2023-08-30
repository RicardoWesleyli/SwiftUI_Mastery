//
//  ContentView.swift
//  Chapter25
//

import SwiftUI

struct ContentView: View {
    @State var isSelected: Bool = false

    var body: some View {
        Rectangle()
            .fill(isSelected ? Color.green : Color.black)
            .frame(width: 200, height: 300)
            .cornerRadius(16)
            .rotation3DEffect(
                .degrees(isSelected ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )

            .onTapGesture {
                withAnimation(.linear(duration: 0.4)) {
                    self.isSelected.toggle()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
