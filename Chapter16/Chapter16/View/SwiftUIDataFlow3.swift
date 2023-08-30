//
//  SwiftUIDataFlow3.swift
//  Chapter16
//

import SwiftUI

struct SwiftUIDataFlow3: View {
    @State var isOpen = false

    var body: some View {
        Toggle(isOn: $isOpen) {
            Text(isOpen ? "开启" : "关闭")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct SwiftUIDataFlow3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDataFlow3()
    }
}
