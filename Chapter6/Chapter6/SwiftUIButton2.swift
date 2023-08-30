//
//  SwiftUIButton2.swift
//  Chapter6
//

import SwiftUI

struct SwiftUIButton2: View {
    var body: some View {
        Button(action: {
            // 点击后的操作
        }) {
            Text("立即使用")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding()
                .frame(width: 180)
                .background(Color.green)
                .cornerRadius(16)
        }
    }
}

struct SwiftUIButton2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButton2()
    }
}
