//
//  HomeView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import SwiftUI

struct GradientView: View {
    @State var showSearchBar = false
    @State var search = ""
    @State var gradients = [GradientModel]()
    @State var colums = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    @State var filtered: [GradientModel] = []
    @State var refresh = RefreshModel(started: false, released: false)

    var body: some View {
        // MARK: 渐变色列表
        VStack {
            SwitchSearchBar

            if gradients.isEmpty {
                Spacer()
                
                LoadingView()

                Spacer()
            } else {
                GradientView
            }
        }
        .onAppear(perform: {
            getGradientColors()

        })
    }

    // MARK: 搜索切换

    private var SwitchSearchBar: some View {
        HStack(spacing: 20) {
            if showSearchBar {
                SearchBarView
                CloseButtonView

            } else {
                GradientTitleView

                Spacer()

                SearchButtonView
                SwitchButtonView
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 10)
        .padding(.horizontal)
        .zIndex(1)
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
                Image(systemName: Constants.searchButton)
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
                    filtered = gradients
                }
            }
    }

    // MARK: 清除按钮

    private var CloseButtonView: some View {
        Button(action: {
            withAnimation(.easeOut) {
                search = ""
                filtered = gradients
                showSearchBar.toggle()
            }
        }, label: {
            Text("取消")
                .foregroundColor(.gray)
        })
    }

    // MARK: 标题

    private var GradientTitleView: some View {
        Text(Constants.gradientTitle)
            .font(.system(size: 30))
            .fontWeight(.bold)
    }

    // MARK: 搜索icon

    private var SearchButtonView: some View {
        Button(action: {
            withAnimation(.easeOut) {
                showSearchBar.toggle()
            }
        }, label: {
            Image(systemName: Constants.searchButton)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.gray)
        })
    }

    // MARK: 切换视图icon

    private var SwitchButtonView: some View {
        Button(action: {
            withAnimation(.easeOut) {
                if colums.count == 1 {
                    colums.append(GridItem(.flexible(), spacing: 20))
                } else {
                    colums.removeLast()
                }
            }
        }, label: {
            Image(systemName: colums.count == 1 ? Constants.squareButton : Constants.rectangleButton)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.gray)
        })
    }

    // MARK: GradientView

    private var GradientView: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            //下拉位置判断
            GeometryReader { reader -> AnyView in
                DispatchQueue.main.async {
                    if refresh.startOffset == 0 {
                        refresh.startOffset = reader.frame(in: .global).minY
                    }
                    refresh.offset = reader.frame(in: .global).minY
                    if refresh.offset - refresh.startOffset > 80 && !refresh.started {
                        refresh.started = true
                    }
                    if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
                        withAnimation(Animation.linear) {
                            refresh.released = true
                        }
                        updateData()
                    }
                }
                return AnyView(Color.black.frame(width: 0, height: 0))
            }
            .frame(width: 0, height: 0)

            // 刷新样式
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                // Arrow and indicator
                if refresh.started && refresh.released {
                    ProgressView()
                        .offset(y: -35)
                } else {
                    VStack(spacing: 5) {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)

                        Text("下拉刷新")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }

                    .offset(y: -40)
                }

                // 渐变色列表
                LazyVGrid(columns: colums, spacing: 20, content: {
                    ForEach(filtered, id: \.name) { gradient in
                        VStack(spacing: 15) {
                            ZStack {
                                LinearGradient(
                                    gradient: .init(colors: HexToRGB(colors: gradient.colors)),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(height: 180)
//                                    .clipShape(CShape())
                                .cornerRadius(15)
//                                    .contentShape(CShape())

                                // 颜色名称
                                Text(gradient.name)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .font(.system(size: 14))
                            }

                            // 长按复制颜色值
                            .contextMenu {
                                Button(action: {
                                    var colorCode = ""
                                    for color in gradient.colors {
                                        colorCode += color + "\n"
                                    }
                                    UIPasteboard.general.string = colorCode
                                }, label: {
                                    Text(Constants.copyGradientText)
                                })
                            }
                        }
                    }
                })
                    .padding(.horizontal)
                    .padding(.bottom)

            })
                .offset(y: refresh.released ? 40 : -10)
        })
            .zIndex(0)
    }

    // MARK: 网络请求

    func getGradientColors() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: Constants.getGradientColorsURL)!) { data, _, _ in
            guard let jsonData = data else { return }

            do {
                let gradientColor = try JSONDecoder().decode([GradientModel].self, from: jsonData)
                self.gradients = gradientColor
                self.filtered = gradientColor
            } catch {
                print(error)
            }
        }
        .resume()
    }

    // MARK: 下拉刷新方法

    func updateData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear) {
                print("下拉刷新")
                getGradientColors()
                refresh.released = false
                refresh.started = false
            }
        }
    }

    // MARK: 搜索颜色方法

    func searchColor() {
        let query = search.lowercased()
        DispatchQueue.global(qos: .background).async {
            let filter = gradients.filter { $0.name.lowercased().contains(query) }

            DispatchQueue.main.async {
                withAnimation(.spring()) {
                    self.filtered = filter
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
