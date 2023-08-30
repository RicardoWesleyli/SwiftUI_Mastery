//
//  SwiftUITextField.swift
//  Chapter7
//

import SwiftUI

struct SwiftUITextField: View {
    @State var inputText: String = ""

    var body: some View {
        TextField("请输入", text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.telephoneNumber)
            .keyboardType(.numberPad)
            .disableAutocorrection(true)
            .padding()
    }
}

struct SwiftUITextField_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextField()
    }
}
