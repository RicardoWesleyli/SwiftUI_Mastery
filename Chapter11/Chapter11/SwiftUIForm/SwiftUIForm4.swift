//
//  SwiftUIForm4.swift
//  Chapter11
//

import SwiftUI

struct SwiftUIForm4: View {
    @State var isDarkMode = false

    var body: some View {
        Form {
            Section(
                header: Text("外观"),
                footer: Text("开启后，主题将切换至深色模式")
            ) {
                Toggle(isOn: $isDarkMode) {
                    Text("夜间模式")
                }
                .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}

struct SwiftUIForm4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIForm4()
    }
}
