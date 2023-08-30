//
//  SwiftUIAnimations2.swift
//  Chapter25
//
//  Created by Ricardo Li on 2023/8/30.
//

import SwiftUI

struct SwiftUIAnimations2: View {
    @State var isOpen: Bool = false

    var body: some View {
        Image(systemName: isOpen ? "xmark" : "plus")
            .font(.system(size: 24))
            .foregroundColor(isOpen ? .gray : .white)
            .padding()
            .background(Color(isOpen ? .systemGray5 : .systemBlue))
            .clipShape(Circle())
            .scaleEffect(isOpen ? 0.8 : 1.2)
            .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3),value: isOpen)
            .onTapGesture {
                self.isOpen.toggle()
            }
    }
}

struct SwiftUIAnimations2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimations2()
    }
}
