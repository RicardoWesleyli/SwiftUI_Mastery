//
//  IndexView.swift
//  Chapter10
//

import SwiftUI

struct IndexView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                // 个人头像
                Image("HeadShot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                VStack(spacing: 10) {
                    // 名称
                    Text("文如秋雨")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    // 头衔
                    Text("高级产品经理")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                // 文字介绍
                Text("一只默默努力变优秀的产品汪，独立负责过多个国内细分领域Top5的企业级产品项目，擅长B端、C端产品规划、产品设计、产品研发，个人独立拥有多个软著及专利，欢迎产品、开发的同僚一起交流 ...")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .lineSpacing(5)
                    .padding(20)

                Spacer()
            }
            .padding(.top, 60)
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
