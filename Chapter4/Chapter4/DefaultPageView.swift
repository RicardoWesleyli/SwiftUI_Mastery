//
//  DefaultPageView.swift
//  Chapter4
//

import SwiftUI

struct DefaultPageView: View {
    var body: some View {
        VStack(spacing: 40) {
            // 缺省页图片
            Image("DefaultImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)

            // 文字指引
            VStack(spacing: 10) {
                Text("还没有收到消息哦")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .bold()

                Text("不如先去社区逛逛吧～")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .bold()
            }
        }
    }
}

struct DefaultPageView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultPageView()
    }
}
