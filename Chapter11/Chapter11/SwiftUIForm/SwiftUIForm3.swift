//
//  SwiftUIForm3.swift
//  Chapter11
//

import SwiftUI

struct SwiftUIForm3: View {
    var body: some View {
        Form {
            Section {
                Text("海棠未雨，梨花先雪。")
                Text("半溪明月，一枕清风。")
            }

            Section {
                Text("东隅已逝，桑榆非晚。")
                Text("松花酿酒，春水煎茶。")
                Text("明月直入，无心可猜。")
            }
        }
    }
}

struct SwiftUIForm3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIForm3()
    }
}
