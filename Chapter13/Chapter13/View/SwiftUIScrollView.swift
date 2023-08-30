//
//  SwiftUIScrollView.swift
//  Chapter13
//

import SwiftUI

struct SwiftUIScrollView: View {
    var body: some View {
        NavigationView {
            VStack {
                hStackScrollVoew
                vStackScrollVoew
            }
            .padding()
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }

    // 横向滚动
    private var hStackScrollVoew: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("横向滚动")
                .font(.system(size: 23))
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(bannerModels) { item in
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 120)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }

    // 纵向滚动
    private var vStackScrollVoew: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("纵向滚动")
                .font(.system(size: 23))
                .bold()
                .padding(.top, 40)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(bannerModels) { item in
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 100)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct SwiftUIScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIScrollView()
    }
}
