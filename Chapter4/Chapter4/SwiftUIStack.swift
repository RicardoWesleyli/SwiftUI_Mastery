//
//  SwiftUIStack.swift
//  Chapter4
//

import SwiftUI

struct SwiftUIStack: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // 背景图片
            Image("StartupPageImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                // 占位空间
                Spacer()
                // 应用图标和应用名称
                HStack(alignment: .center, spacing: 20) {
                    // 应用图标
                    Image("ApplicationIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                        .cornerRadius(16)

                    // 应用名称
                    Text("夜空鱼")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}

struct SwiftUIStack_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStack()
    }
}
