//
//  ContentView.swift
//  NotificationToast
//
//  Created by Ricardo Li on 2022/8/26.
//

import SwiftUI

struct ContentView: View {
    @State var offset: CGFloat = -UIScreen.main.bounds.height / 2 - 80

    var body: some View {
        ZStack {
            NotificationToastView(notificationImage: "me", notificationTitle: "文如秋雨", notificationContent: "一只默默努力变优秀的产品汪，独立负责过多个国内细分领域Top5的企业级产品项目，擅长B端、C端产品规划、产品设计、产品研发，个人独立拥有多个软著及专利，欢迎产品、开发的同僚一起交流", notificationTime: "2分钟前")
                .offset(x: 0, y: offset)
                .animation(.interpolatingSpring(stiffness: 120, damping: 10))

            Button(action: {
                if offset <= 0 {
                    offset += 180

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.offset -= 180
                    }
                }

            }) {
                Text("弹出通知")
            }
        }
    }
}

struct NotificationToastView: View {
    var notificationImage: String
    var notificationTitle: String
    var notificationContent: String
    var notificationTime: String

    var body: some View {
        HStack {
            Image(notificationImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))

            VStack(spacing: 10) {
                HStack {
                    Text(notificationTitle)
                        .font(.system(size: 17))
                        .foregroundColor(.black)

                    Spacer()
                    Text(notificationTime)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }

                Text(notificationContent)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
            }
        }

        .padding()
        .frame(minWidth: 10, maxWidth: .infinity, minHeight: 10, maxHeight: 120)
        .background(.white)
        .cornerRadius(30)
        .shadow(color: Color(.systemGray4), radius: 5, x: 1, y: 1)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
