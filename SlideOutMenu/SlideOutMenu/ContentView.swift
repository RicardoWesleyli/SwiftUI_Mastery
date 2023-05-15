//
//  ContentView.swift
//  SlideOutMenu
//
//  Created by Ricardo Li on 2022/8/17.
//

import SwiftUI

struct ContentView: View {
    @State var menuWidth = UIScreen.main.bounds.width - 60
    @State var offsetX = -UIScreen.main.bounds.width + 60

    var body: some View {
        ZStack {
            NavigationView {
                Text("点击左上角侧滑展开")
                    .padding()
                    .navigationBarTitle("首页", displayMode: .inline)
                    .navigationBarItems(leading: moreBtnView)
            }

            SlideOutMenu(menuWidth: $menuWidth, offsetX: $offsetX)
        }
        .gesture(DragGesture().onChanged(onChanged(_:)).onEnded(onEnd(_:)))
        .edgesIgnoringSafeArea(.top)
    }

    // 顶部导航入口
    private var moreBtnView: some View {
        Button(action: {
            withAnimation {
                offsetX = 0
            }
        }) {
            Image(systemName: "list.bullet")
                .foregroundColor(.black)
        }
    }
}

// MARK: 左侧菜单

struct SlideOutMenu: View {
    @Binding var menuWidth: CGFloat
    @Binding var offsetX: CGFloat

    var body: some View {
        Form {
            Section {
            }
            Section {
                listItemView(itemImage: "lock", itemName: "账号绑定")
                listItemView(itemImage: "gear.circle", itemName: "通用设置")
                listItemView(itemImage: "briefcase", itemName: "简历管理")
            }
            Section {
                listItemView(itemImage: "icloud.and.arrow.down", itemName: "版本更新")
                listItemView(itemImage: "leaf", itemName: "清理缓存")
                listItemView(itemImage: "person", itemName: "关于掘金")
            }
        }
        .padding(.trailing, UIScreen.main.bounds.width - menuWidth)
        .edgesIgnoringSafeArea(.all)
        .shadow(color: Color.black.opacity(offsetX != 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
        .offset(x: offsetX)
        .background(
            Color.black.opacity(offsetX == 0 ? 0.5 : 0)
                .ignoresSafeArea(.all, edges: .vertical)
                .onTapGesture {
                    withAnimation {
                        offsetX = -menuWidth
                    }
                })
    }
}

// MARK: 栏目结构

struct listItemView: View {
    var itemImage: String
    var itemName: String
    var body: some View {
        Button(action: {
        }) {
            HStack {
                Image(systemName: itemImage)
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                Text(itemName)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }.padding(.vertical, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Actions

extension ContentView {
    /// 开始拖动修改
    /// - Parameter value: 拖动的值
    func onChanged(_ value: DragGesture.Value) {
        // 拖动时的 X 值
        let currentX = value.translation.width

        print("currentX: \(currentX)")

        withAnimation {
            if currentX > 0 {
                // 禁用拖动...
                if offsetX < 0 {
                    offsetX = -menuWidth + currentX
                }
            } else {
                if offsetX != -menuWidth {
                    offsetX = currentX
                }
            }
        }
    }

    /// 拖动结束
    /// - Parameter value: 拖动的值
    func onEnd(_ value: DragGesture.Value) {
        withAnimation {
            print("x: \(offsetX)")

            // 检查是否拖动了菜单值的一半意味着将x设置为0 ...
            if -offsetX < menuWidth / 2 {
                offsetX = 0
            } else {
                offsetX = -menuWidth
            }
        }
    }
}
