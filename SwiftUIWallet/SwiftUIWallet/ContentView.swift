//
//  ContentView.swift
//  SwiftUIWallet
//
//  Created by Ricardo Li on 2022/7/6.
//

import SwiftUI

struct ContentView: View {
    @State var selectedColor: Color = Color.Hex(0xFF0000)
    @State var showDetail: Bool = false
    @Namespace private var animation

    var body: some View {
        NavigationView {
            VStack {
                if !showDetail {
                    CardListView
                        .matchedGeometryEffect(id: "OneCardView", in: animation)
                       
                }
            }
            .navigationTitle("钱包")
        }
        .overlay(alignment: .top) {
            if showDetail {
                OneCardView
                    
            }
        }
    }

    // MARK: 单张卡片

    private var OneCardView: some View {
        CardView(cardBGColor: selectedColor)
            .matchedGeometryEffect(id: "OneCardView", in: animation)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    showDetail = false
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .background(Color.white.opacity(showDetail ? 1 : 0))
            .transition(.offset(x: 1, y: 1))
            
    }

    // MARK: 卡片列表

    private var CardListView: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ForEach(sampleModels) { item in
                VStack {
                    CardView(cardBGColor: item.cardBGColor)
                        .padding(.horizontal)
                        .onTapGesture {
                            selectedColor = item.cardBGColor

                            withAnimation(.easeInOut(duration: 1)) {
                                showDetail = true
                            }
                        }
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: 卡片视图

struct CardView: View {
    var cardBGColor: Color

    var body: some View {
        Rectangle()
            .fill(cardBGColor)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 180, maxHeight: 180)
            .cornerRadius(15)
    }
}
