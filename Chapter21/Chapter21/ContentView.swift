//
//  ContentView.swift
//  Chapter21
//

import SwiftUI

struct ContentView: View {
    // 引入VM
    @StateObject var viewModel = ViewModel()
    @State private var isOpenFaceID = false

    var body: some View {
        if viewModel.isOpenFaceID {
            if !viewModel.isLock {
                faceIDLockView
            } else {
                faceIDToggleView
            }
        } else {
            faceIDToggleView
        }
    }

    // 面容ID登录
    private var faceIDToggleView: some View {
        HStack {
            Text("面容 ID 登录")
            Toggle(isOn: $isOpenFaceID) {
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
        // 开关状态更新时
        .onChange(of: isOpenFaceID) { value in
            viewModel.isOpenFaceID = value
        }

        // 展示时
        .onAppear {
            self.isOpenFaceID = viewModel.isOpenFaceID
        }
    }

    // FaceID解锁页面
    private var faceIDLockView: some View {
        VStack(spacing: 20) {
            Image(systemName: "faceid")
                .font(.system(size: 48))
                .foregroundColor(.red)
            Text("点击进行面容ID登录")
        }
        // 点击解锁
        .onTapGesture {
            viewModel.authenticate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
