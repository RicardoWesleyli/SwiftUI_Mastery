//
//  SwiftUIAnimations5.swift
//  Chapter25
//

import SwiftUI

struct SwiftUIAnimations5: View {
    @State var isLoading: Bool = false

    var body: some View {
        HStack {
            ForEach(0 ..< 4) { index in
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                    .scaleEffect(isLoading ? 1.0 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.5)
                        .repeatForever()
                        .delay(Double(index) * 0.2),
                        value: isLoading)
            }
        }
        .onAppear {
            self.isLoading.toggle()
        }
    }
}

struct SwiftUIAnimations5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimations5()
    }
}
