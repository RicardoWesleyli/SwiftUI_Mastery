//
//  SwiftUIGesture2.swift
//  Chapter14
//

import SwiftUI

struct SwiftUIGesture2: View {
    @State private var number: Int = 0
    @State private var numberArray: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    var body: some View {
        VStack(spacing: 80) {
            // 数字
            Text(String(number))
                .font(.title)

            // 按钮
            Text("换一换")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .frame(width: 120, height: 48)
                .background(Color.green)
                .cornerRadius(8)

                // 手势修饰器
                .gesture(
                    // 点击手势
                    TapGesture()
                        .onEnded({
                            numberArray = numberArray.shuffled()
                            for item in numberArray {
                                number = item
                            }
                        })
                )
        }
    }
}

struct SwiftUIGesture2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGesture2()
    }
}
