//
//  SwiftUIDataFlow4.swift
//  Chapter16
//

import SwiftUI

// 主页
struct SwiftUIDataFlow4: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        VStack {
            HStack {
                Text("用户名")
                Spacer()
                HStack {
                    Text(viewModel.inputText)
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)

            // 点击
            .onTapGesture {
                viewModel.showDataFlowDetailView.toggle()
            }

            Spacer()
        }

        // 打开模态弹窗
        .sheet(isPresented: $viewModel.showDataFlowDetailView) {
            DataFlowDetailView()
        }
    }
}

// 详情页
struct DataFlowDetailView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("请输入", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Spacer()
            }
            .navigationBarTitle("修改用户名", displayMode: .inline)
            .navigationBarItems(leading: closeBtn)
        }
    }

    // 关闭按钮
    private var closeBtn: some View {
        Button(action: {
            viewModel.showDataFlowDetailView.toggle()
        }) {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray)
        }
    }
}

struct SwiftUIDataFlow4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDataFlow4()
            .environmentObject(ViewModel())
    }
}
