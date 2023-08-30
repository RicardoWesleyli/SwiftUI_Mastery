//
//  SwiftUIDataFlow2.swift
//  Chapter16
//

import SwiftUI

struct SwiftUIDataFlow2: View {
    @State var inputText: String = ""

    var body: some View {
        TextField("请输入", text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct SwiftUIDataFlow2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDataFlow2()
    }
}
