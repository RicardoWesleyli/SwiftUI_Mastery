//
//  ContentView.swift
//  SwiftUISubscription
//

import StoreKit
import SwiftUI

struct ContentView: View {
    @State var openSubscriptionView: Bool = false

    var body: some View {
        Button(action: {
            self.openSubscriptionView.toggle()
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 32))
                .foregroundColor(.blue)
        }
        // 打开订阅页面
        .sheet(isPresented: $openSubscriptionView, content: {
            SubscriptionView()
        })
    }
}

// 内购页面
struct SubscriptionView: View {
    @Environment(\.presentationMode) var presentationMode

    // 引入Store
    @StateObject var store = Store()

    var body: some View {
        ZStack {
            // 顶部导航
            VStack {
                HStack {
                    Spacer()
                    closeBtn
                }
                Spacer()
            }

            VStack(spacing: 60) {
                // 图片&标题
                titleView

                // 支付按钮
                payBtn

                // 功能说明
                functionDescription

                // 恢复购买按钮
                restoreBtn
            }
        }
    }

    // 关闭按钮
    private var closeBtn: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 32))
                .foregroundColor(Color(.systemGray4))
                .padding()
        }
    }

    // 图片&标题
    private var titleView: some View {
        VStack(spacing: 15) {
            Image("Wallet")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)

            Text("解锁完整功能")
                .font(.system(size: 14))
                .bold()
        }
    }

    // 支付按钮
    private var payBtn: some View {
        ForEach(store.allProducts, id: \.self) { product in
            VStack(spacing: 15) {
                // 提取产品价格
                if let price = product.price {
                    // 支付按钮
                    Button(action: {
                        // 唤起支付
                        if let product = store.product(for: product.id) {
                            store.purchaseProduct(product)
                        }

                    }) {
                        Text("支付" + "\(price)")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal, 60)
                            .background(.green)
                            .clipShape(Capsule())
                    }
                }
            }
            // 异步执行
            .task {
                if !product.isLocked {
                    // 关闭弹窗
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }

    // 功能说明
    private var functionDescription: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("1.超大空间，随心收藏与备份")
            Text("2.极速下载，最高50M/s")
            Text("3.180天内删除的文件快速恢复")
            Text("4.大文件上传，最高100GB")
            Text("5.视频备份，支持高清原画")
            Text("......")
        }
        .font(.system(size: 15))
        .foregroundColor(.gray)
        .padding()
    }

    // 恢复购买按钮
    private var restoreBtn: some View {
        Button(action: {
            // 恢复购买
            store.restorePurchases()
        }) {
            Text("恢复购买")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
