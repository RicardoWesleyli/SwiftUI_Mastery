//
//  ContentView.swift
//  Chapter20
//

import SwiftUI

struct ContentView: View {
    @State var showShareSheet: Bool = false
    @State var shareImage: UIImage?

    var body: some View {
        imageCard
            .onTapGesture {
                // 数据对象
                shareImage = imageCard.snapshot()

                // 打开分享弹窗
                self.showShareSheet.toggle()
            }

            // 分享弹窗
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(items: shareImage as Any)
            }
    }

    // 文字卡片
    private var imageCard: some View {
        ZStack {
            Image("CloudImage")
                .resizable()
                .frame(width: 300, height: 200)
                .cornerRadius(16)
                .overlay(
                    Text("月亮很亮，亮也没用，没用也亮。我喜欢你，喜欢也没用，没用也喜欢。")
                        .padding(.horizontal)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
