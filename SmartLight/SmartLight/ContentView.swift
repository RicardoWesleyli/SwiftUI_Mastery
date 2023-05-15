//
//  ContentView.swift
//  SmartLight
//
//  Created by Ricardo Li on 2022/7/31.
//

import SwiftUI

struct ContentView: View {
    @State var isOpen: Bool = false
    var body: some View {
        ZStack {
            bgCard()

            VStack {
                titleView()
                Spacer()
                lightView()
                Spacer()
                Spacer()
                switchBtn()
            }
        }
    }

    // 背景卡片
    func bgCard() -> some View {
        Rectangle()
            .foregroundColor(Color(red: 88 / 255, green: 132 / 255, blue: 234 / 255))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .cornerRadius(16)
            .shadow(radius: 2)
            .padding()
    }

    // 标题
    func titleView() -> some View {
        Text("卧室灯")
            .font(.system(size: 17))
            .fontWeight(.bold)
            .padding(.top, 40)
            .foregroundColor(.white)
    }

    // 灯
    func lightView() -> some View {
        Circle()
            .stroke(Color(.systemGray6), lineWidth: 80)
            .opacity(isOpen ? 0.9 : 0.5)
            .frame(width: 20, height: 20, alignment: .center)
            .shadow(color: .white, radius: isOpen ? 30 : 0, x: 0, y: 0)
    }

    // 开关
    func switchBtn() -> some View {
        VStack(spacing: 20) {
            Image(systemName: "power")
                .foregroundColor(isOpen ? .white : .black)
                .font(.system(size: 32))
                .onTapGesture {
                    self.isOpen.toggle()
                }

            Text(isOpen ? "点击关灯" : "点击开灯")
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(isOpen ? .white : .black)
        }.padding(.bottom, 80)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
