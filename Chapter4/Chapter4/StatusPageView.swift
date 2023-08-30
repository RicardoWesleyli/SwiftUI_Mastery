//
//  StatusPageView.swift
//  Chapter4
//

import SwiftUI

struct StatusPageView: View {
    var body: some View {
        ZStack{
            
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
                Image("PopoverImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120)
                
                // 文字指引
                VStack(spacing: 10) {
                    Text("签到成功")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .bold()
                    
                    Text("再签2天可获得500积分")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                }
                
                // 确认按钮
                Text("知道了")
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

struct StatusPageView_Previews: PreviewProvider {
    static var previews: some View {
        StatusPageView()
    }
}
