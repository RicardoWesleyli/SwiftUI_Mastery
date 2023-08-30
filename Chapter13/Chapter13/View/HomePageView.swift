//
//  HomePageView.swift
//  Chapter13
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            bannerView
            featureGroup
            productList
        }
    }

    // 轮播图
    private var bannerView: some View {
        TabView {
            ForEach(coffeeModels) { item in
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 200)
    }

    // 快捷按钮组
    private var featureGroup: some View {
        HStack {
            FeatureBtn(iconImage: "mifan", iconName: "米饭")
            FeatureBtn(iconImage: "chadian", iconName: "茶点")
            FeatureBtn(iconImage: "lengyin", iconName: "冷饮")
            FeatureBtn(iconImage: "shuiguo", iconName: "水果")
            FeatureBtn(iconImage: "tianpin", iconName: "甜品")
        }
        .padding(.vertical, 15)
    }

    // 商品列表
    private var productList: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("为你推荐")
                .font(.system(size: 17))
                .bold()

            ForEach(productModels) { item in
                ProductList(productImage: item.productImage, productName: item.productName, size: item.size, price: item.price)
            }
        }
        .padding(.horizontal, 20)
    }
}

// 快捷按钮组件
struct FeatureBtn: View {
    var iconImage: String
    var iconName: String

    var body: some View {
        VStack(spacing: 10) {
            Image(iconImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32)

            Text(iconName)
                .font(.system(size: 14))
        }
        .padding(.horizontal)
    }
}

// 推荐列表组件
struct ProductList: View {
    var productImage: String
    var productName: String
    var size: String
    var price: Int

    var body: some View {
        HStack(alignment: .bottom) {
            HStack(spacing: 15) {
                // 商品图
                Image(productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)

                VStack(alignment: .leading, spacing: 10) {
                    // 商品名称
                    Text(productName)
                        .font(.system(size: 17))
                        .bold()

                    // 商品规格
                    Text("默认:" + size)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)

                    // 商品价格
                    Text("¥" + String(price))
                        .font(.system(size: 17))
                        .foregroundColor(.red)
                        .bold()
                }
            }

            Spacer()

            // 添加按钮
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 24))
                .foregroundColor(.blue)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
