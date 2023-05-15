//
//  HomeView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import SwiftUI

struct CardView: View {
    @State var cardItems: [CardModel] = []
    @Binding var showCardView: Bool

    var body: some View {
        VStack {
            HStack {
                CardTitleView
                Spacer()
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            .padding(.horizontal)
            
            if cardItems.isEmpty {
                Spacer()
                
                LoadingView()

                Spacer()
            } else {
                CardListView
            }
            

            Spacer()
        }
        .onAppear(perform: {
            getColors()
        })
    }

    // MARK: 标题

    private var CardTitleView: some View {
        HStack{
            Image(systemName: "arrow.backward.circle.fill")
                .foregroundColor(Color.gray)
                .font(.system(size: 24))
                .onTapGesture {
                    withAnimation(.linear(duration: 0.3)){
                    self.showCardView = false
                    }
                }
            Spacer()
            Text(Constants.cardTitle)
                .font(.system(size: 17))
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "paperplane.fill")
                .foregroundColor(Color.gray)
                .font(.system(size: 24))
        }
    }

    // MARK: 卡片视图

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

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}

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
                    Text(cardColorName)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .font(.system(size: 17))

                    // 标题名称
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
                    Text(Constants.copyGradientText)
                })
            }
            .padding(.horizontal)
    }
}
