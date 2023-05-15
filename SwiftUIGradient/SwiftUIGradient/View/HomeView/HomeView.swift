//
//  HomeView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/7/1.
//

import SwiftUI

struct HomeView: View {
    @State var homeItems: [HomeModel] = []
    @State var showCardView: Bool = false

    var body: some View {
        // 首页视图
        ZStack {
            if homeItems.isEmpty {
                Spacer()

                LoadingView()

                Spacer()
            } else {
                VStack {
                    HomeViewCardGroup
                    Spacer()
                }
            }

            if showCardView {
                // 蒙层
                MaskView(bgColor: .white)
                    .transition(.move(edge: showCardView ? .trailing : .leading))

                CardView(showCardView: $showCardView)
                    .transition(.move(edge: showCardView ? .trailing : .leading))
            }
        }
        .onAppear(perform: {
            getIndexMessage()
        })
    }

    // MARK: 卡片组

    private var HomeViewCardGroup: some View {
        ScrollView(showsIndicators: false) {
//            ForEach(homeItems, id: \.title) { item in

                // 主要标题
                VStack {
                    HStack {
                        Text(Constants.homeTitle)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .padding(.top, 20)
                            .padding(.horizontal)
                        Spacer()
                    }

                    // 栏目内容
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(homeItems, id: \.title) { item in

                                HomeViewExamples(imageURL: item.imageURL, title: item.title, subHeadline: item.subHeadline)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.3)) {
                                            self.showCardView = true
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
//            }
        }
    }

    // MARK: 网络请求

    func getIndexMessage() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: Constants.getIndexMessage)!) { data, _, _ in
            guard let jsonData = data else { return }

            do {
                let message = try JSONDecoder().decode([HomeModel].self, from: jsonData)
                self.homeItems = message
            } catch {
                print(error)
            }
        }
        .resume()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// MARK: 单张卡片

struct HomeViewExamples: View {
    var imageURL: String
    var title: String
    var subHeadline: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: imageURL))
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 120, maxWidth: 120, minHeight: 120, maxHeight: 120)
                .cornerRadius(8)
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
                .font(.system(size: 17))
            Text(subHeadline)
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
                .font(.system(size: 14))
        }
    }
}
