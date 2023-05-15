//
//  ContentView.swift
//  WritingView
//
//  Created by Ricardo Li on 2022/8/16.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TabberView(selectedIndex: $selectedIndex)
            }
            .navigationBarTitle("首页", displayMode: .inline)
//            .navigationBarItems(trailing: publishBtnView)
        }
    }

    // 顶部导航入口
    private var publishBtnView: some View {
        Button(action: {
        }) {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.blue)
        }
    }

    // 悬浮入口
    private var suspendBtnView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()

                Button(action: {
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.bottom, 32)
        .padding(.trailing, 32)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 底部导航入口
struct TabberView: View {
    @Binding var selectedIndex: Int
    var body: some View {
        HStack {
            // 首页
            Button(action: {
                self.selectedIndex = 0
            }) {
                VStack(spacing: 10) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                    Text("首页")
                        .font(.system(size: 14))
                }
            }.foregroundColor((self.selectedIndex == 0) ? .blue : .gray)

            Spacer(minLength: 0)

            // 沸点
            Button(action: {
                self.selectedIndex = 1
            }) {
                VStack(spacing: 10) {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 24))
                    Text("沸点")
                        .font(.system(size: 14))
                }
            }.foregroundColor((self.selectedIndex == 1) ? .blue : .gray)

            Spacer(minLength: 0)

            // 发布文章
            Button(action: {
                self.selectedIndex = 2
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 48))
            }.foregroundColor(.blue)

            Spacer(minLength: 0)

            // 课程
            Button(action: {
                self.selectedIndex = 3
            }) {
                VStack(spacing: 10) {
                    Image(systemName: "book.closed.fill")
                        .font(.system(size: 24))
                    Text("课程")
                        .font(.system(size: 14))
                }
            }.foregroundColor((self.selectedIndex == 3) ? .blue : .gray)

            Spacer(minLength: 0)

            // 我的
            Button(action: {
                self.selectedIndex = 4
            }) {
                VStack(spacing: 10) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 24))
                    Text("我的")
                        .font(.system(size: 14))
                }
            }.foregroundColor((self.selectedIndex == 4) ? .blue : .gray)

        }.padding(.horizontal, 35)
    }
}
