//
//  ContentView.swift
//  UnitConversion
//
//  Created by Ricardo Li on 2022/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var beforeMenu: String = "时"
    @State var afterMenu: String = "秒"
    @State var beforeText: String = ""
    @State var afterText: String = "0"
    @State var showResult: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            titleView()

            HStack {
                beforeMenuView()
                afterMenuView()
            }
            numberView()
            Spacer()
        }.padding(.horizontal)
    }

    // 标题
    func titleView() -> some View {
        HStack {
            Text("时分秒转换")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }

    // 输入值类型
    func beforeMenuView() -> some View {
        Menu {
            Button("时") { self.beforeMenu = "时" }
            Button("分") { self.beforeMenu = "分" }
            Button("秒") { self.beforeMenu = "秒" }
        } label: {
            Label(beforeMenu, systemImage: "chevron.down")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 60)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }

    // 输出值类型
    func afterMenuView() -> some View {
        Menu {
            Button("时") { self.afterMenu = "时" }
            Button("分") { self.afterMenu = "分" }
            Button("秒") { self.afterMenu = "秒" }
        } label: {
            Label(afterMenu, systemImage: "chevron.down")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 60)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }

    // 输入输出值
    func numberView() -> some View {
        HStack(spacing: 20) {
            TextField("请输入", text: $beforeText)
                .keyboardType(.decimalPad)
                .foregroundColor(.black)
                .font(.system(size: 17))
                .padding()
                .onChange(of: beforeText) { _ in
                    if beforeText != "" {
                        self.showResult = true
                        calculateMethod()
                    } else {
                        self.showResult = false
                    }
                }

            Spacer()

            if showResult {
                Text("=" + afterText + afterMenu)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .padding()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 120)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }

    // 计算方法
    func calculateMethod() {
        if beforeMenu == "时" && afterMenu == "分" {
            afterText = String((Double(beforeText) ?? 0) * 60)
        } else if beforeMenu == "时" && afterMenu == "秒" {
            afterText = String((Double(beforeText) ?? 0) * 3600)
        } else if beforeMenu == "分" && afterMenu == "秒" {
            afterText = String((Double(beforeText) ?? 0) * 60)
        } else if beforeMenu == "分" && afterMenu == "时" {
            afterText = String((Double(beforeText) ?? 0) / 60)
        } else if beforeMenu == "秒" && afterMenu == "分" {
            afterText = String((Double(beforeText) ?? 0) / 60)
        } else if beforeMenu == "秒" && afterMenu == "时" {
            afterText = String((Double(beforeText) ?? 0) / 3600)
        } else {
            afterText = beforeText
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
