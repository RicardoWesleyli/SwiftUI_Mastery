//
//  SwiftUIForm2.swift
//  Chapter11
//

import SwiftUI

struct SwiftUIForm2: View {
    var body: some View {
        Form{
            Text("海棠未雨，梨花先雪。")
            Text("半溪明月，一枕清风。")
            Text("东隅已逝，桑榆非晚。")
            Text("松花酿酒，春水煎茶。")
            Text("明月直入，无心可猜。")
        }
    }
}

struct SwiftUIForm2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIForm2()
    }
}
