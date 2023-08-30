//
//  SwiftUIGesture3.swift
//  Chapter14
//

import SwiftUI

struct SwiftUIGesture3: View {
    @State private var isAdd: Bool = true

    var body: some View {
        Image(systemName: isAdd ? "plus" : "xmark")
            .font(.system(size: 23))
            .foregroundColor(isAdd ?.blue: .gray)
            .padding()
            .background(Color(isAdd ?.systemGray6 : .systemGray5))
            .clipShape(Circle())

            // 手势修饰器
            .gesture(
                // 点击手势
                TapGesture()
                    .onEnded({
                        self.isAdd.toggle()
                    })
            )
    }
}

struct SwiftUIGesture3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGesture3()
    }
}
