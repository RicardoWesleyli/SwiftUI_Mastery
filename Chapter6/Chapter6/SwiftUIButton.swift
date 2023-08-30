//
//  SwiftUIButton.swift
//  Chapter6
//

import SwiftUI

struct SwiftUIButton: View {
    @State var finNumber: Int = 1
    var number: Int = 1

    var body: some View {
        // 布局容器
        VStack(spacing: 32) {
            // 文字内容
            Text("功德+" + String(finNumber))
                .font(.system(size: 20))
                .foregroundColor(.black)

            // 图片按钮
            Image("WoodenFish")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                // 点击操作
                .onTapGesture {
                    finNumber += number
                }
        }
    }
}

struct SwiftUIButton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButton()
    }
}
