//
//  SwiftUIAnimations3.swift
//  Chapter25
//

import SwiftUI

struct SwiftUIAnimations3: View {
    @State var isSelected: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isSelected ? Color.yellow : Color.white)
                .frame(width: 120, height: 120)
                .cornerRadius(32)

            Image(systemName: "flame.fill")
                .font(.system(size: isSelected ? 68 : 48))
                .foregroundColor(isSelected ? .red : .yellow)
        }
//        .animation(.spring(), value: isSelected)
        .onTapGesture {
            withAnimation(.spring()){
                self.isSelected.toggle()
            }
        }
    }
}

struct SwiftUIAnimations3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimations3()
    }
}
