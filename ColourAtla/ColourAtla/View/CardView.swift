//
//  CardView.swift
//  ColourAtla
//
//  Created by Ricardo Li on 2022/7/8.
//

import SwiftUI

struct CardView: View {
    @State var cardItems: [CardModel] = []
    @State var search = ""
    @State var showSearchBar = false

    var body: some View {
        VStack {
            SwitchSearchBar

            if cardItems.isEmpty {
                Spacer()

                LoadingView()

                Spacer()
            } else {
                CardListView
            }
        }
        .onAppear(perform: {
            getColors()
        })
    }

    // MARK: 搜索切换

    private var SwitchSearchBar: some View {
        HStack(spacing: 20) {
            if showSearchBar {
                SearchBarView
                CloseButtonView

            } else {
                CardTitleView

                Spacer()

                SearchButtonView
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 10)
        .padding(.horizontal)
        .zIndex(1)
    }

    // MARK: 标题

    private var CardTitleView: some View {
        Text("色卡")
            .font(.system(size: 24))
            .fontWeight(.bold)
    }

    // MARK: 搜索

    private var SearchBarView: some View {
        TextField("搜索颜色值", text: $search)
            .modifier(ClearTextButton(text: $search))
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            )
            .padding(.horizontal, 10)
            .onChange(of: search) { _ in
                if search != "" {
                    searchColor()
                } else {
                    search = ""
                    getColors()
                }
            }
    }

    // MARK: 搜索icon

    private var SearchButtonView: some View {
        Button(action: {
            withAnimation(.easeOut) {
                showSearchBar.toggle()
            }
        }, label: {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.gray)
        })
    }

    // MARK: 清除按钮

    private var CloseButtonView: some View {
        Button(action: {
            withAnimation(.easeOut) {
                search = ""
                getColors()
                showSearchBar.toggle()
            }
        }, label: {
            Text("取消")
                .foregroundColor(.gray)
        })
    }

    // MARK: 搜索颜色方法

    func searchColor() {
        let query = search.lowercased()
        DispatchQueue.global(qos: .background).async {
            let filter = cardItems.filter { $0.cardColorRBG.lowercased().contains(query) }

            DispatchQueue.main.async {
                withAnimation(.spring()) {
                    self.cardItems = filter
                }
            }
        }
    }

    // MARK: 色卡列表视图

    private var CardListView: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ForEach(cardItems, id: \.cardColorRBG) { item in
                VStack(spacing: 20) {
                    CardViewExamples(cardBGColor: Color.Hex(item.cardBGColor), cardColorName: item.cardColorName, cardColorRBG: item.cardColorRBG)
                }
            }
        })
    }

    // MARK: 网络请求

    func getColors() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: Constants.getColorsURL)!) { data, _, _ in
            guard let jsonData = data else { return }

            do {
                let colors = try JSONDecoder().decode([CardModel].self, from: jsonData)
                self.cardItems = colors
            } catch {
                print(error)
            }
        }
        .resume()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

// MARK: 卡片视图

struct CardViewExamples: View {
    var cardBGColor: Color
    var cardColorName: String
    var cardColorRBG: String

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            // 背景卡片
            Rectangle()
                .fill(cardBGColor)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 110)
                .cornerRadius(8)

            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    // 颜色名称
                    Text(cardColorName)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .font(.system(size: 17))

                    // 颜色值
                    Text(cardColorRBG)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))
                }

                Spacer()
            }.padding()

        })

            // 长按复制颜色值
            .contextMenu {
                Button(action: {
                    UIPasteboard.general.string = cardColorName
                }, label: {
                    Text("复制颜色值")
                })
            }
            .padding(.horizontal)
    }
}
