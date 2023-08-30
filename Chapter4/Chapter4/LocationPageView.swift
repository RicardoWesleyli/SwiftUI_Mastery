//
//  LocationPageView.swift
//  Chapter4
//

import SwiftUI

struct LocationPageView: View {
    var body: some View {
        ZStack {
            // 遮罩
            VStack {
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.black)
            .opacity(0.6)
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // 展示图片
                Image("PopoverImage2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160)
                // 文字指引
                VStack(spacing: 10) {
                    Text("开启位置访问")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .bold()

                    Text("在使用该应用时访问您的位置，用于绘制您的跑步轨迹")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                }
                // 确认按钮
                Text("马上开启")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(width: 180)
                    .background(Color.green)
                    .cornerRadius(32)
            }
            .padding()
            .frame(maxWidth: 320)
            .background(Color.white)
            .cornerRadius(16)
        }
    }
}

struct LocationPageView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPageView()
    }
}
