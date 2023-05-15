//
//  ContentView.swift
//  MyMenu
//
//  Created by Ricardo Li on 2022/7/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    @State var DefaultTime: String = "午餐"
    @State var DefaultImageURL: String = "https://img0.baidu.com/it/u=156558209,1663147989&fm=253&fmt=auto&app=138&f=JPEG?w=626&h=500"
    @State var DefaultName: String = "今天想吃点啥？"
    @State var showChooseTimeSheet: Bool = false
    @State var showResult: Bool = false

    var body: some View {
        VStack(spacing: 30) {
            TitleView(time: DefaultTime)
            Spacer()
            if !showResult {
                CardView(imageURL: DefaultImageURL, name: DefaultName)
            } else {
                LoadingView()
            }
            Spacer()
            ChooseBtn()
        }
        .onAppear {
            DefaultTime = viewModel.currentTimeName
        }
        // 选择餐段
        .actionSheet(isPresented: $showChooseTimeSheet, content: { ChooseTimeSheet })
    }

    // 标题
    func TitleView(time: String) -> some View {
        HStack {
            Text("当前餐段 : " + time)
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "rectangle.grid.1x2.fill")
                .foregroundColor(Color.Hex(0x67C23A))
                .onTapGesture {
                    self.showChooseTimeSheet.toggle()
                }
        }
        .padding(.horizontal)
        .padding(.top)
    }

    // 切换餐段
    private var ChooseTimeSheet: ActionSheet {
        let action = ActionSheet(
            title: Text("餐段"), message: Text("请选择餐段"), buttons: [
                .default(Text("早餐"), action: {
                    self.DefaultTime = "早餐"
                    viewModel.getMenu()
                    DefaultImageURL = "https://img0.baidu.com/it/u=156558209,1663147989&fm=253&fmt=auto&app=138&f=JPEG?w=626&h=500"
                    DefaultName = "今天想吃点啥？"
                }),
                .default(Text("午餐"), action: {
                    self.DefaultTime = "午餐"
                    viewModel.getMenu()
                    DefaultImageURL = "https://img0.baidu.com/it/u=156558209,1663147989&fm=253&fmt=auto&app=138&f=JPEG?w=626&h=500"
                    DefaultName = "今天想吃点啥？"
                }),
                .default(Text("下午茶"), action: {
                    self.DefaultTime = "下午茶"
                    viewModel.getMenu()
                    DefaultImageURL = "https://img0.baidu.com/it/u=156558209,1663147989&fm=253&fmt=auto&app=138&f=JPEG?w=626&h=500"
                    DefaultName = "今天想吃点啥？"
                }),
                .default(Text("晚餐"), action: {
                    self.DefaultTime = "晚餐"
                    viewModel.getMenu()
                    DefaultImageURL = "https://img0.baidu.com/it/u=156558209,1663147989&fm=253&fmt=auto&app=138&f=JPEG?w=626&h=500"
                }),
                .default(Text("宵夜"), action: {
                    self.DefaultTime = "宵夜"
                    viewModel.getMenu()
                    DefaultImageURL = "https://img0.baidu.com/it/u=156558209,1663147989&fm=253&fmt=auto&app=138&f=JPEG?w=626&h=500"
                    DefaultName = "今天想吃点啥？"
                }),
                .cancel(Text("取消"), action: {}),
            ]
        )
        return action
    }

    // 推荐结果
    func CardView(imageURL: String, name: String) -> some View {
        VStack {
            AsyncImage(url: URL(string: imageURL))
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 120, maxWidth: .infinity, minHeight: 120, maxHeight: .infinity)
            Text(name)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
        }
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.Hex(0x67C23A), lineWidth: 2))
        .padding([.top, .horizontal])
    }

    // 推荐按钮
    func ChooseBtn() -> some View {
        Button(action: {
            viewModel.getMealMessage(time: DefaultTime)
            viewModel.getRandomFood()

            self.showResult = true

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                self.showResult = false
                DefaultImageURL = viewModel.currentImageURL
                DefaultName = viewModel.currentName
            }

        }) {
            Text("一键推荐")
                .font(.system(size: 17))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.Hex(0x67C23A))
                .cornerRadius(5)
                .padding(.horizontal, 20)
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
