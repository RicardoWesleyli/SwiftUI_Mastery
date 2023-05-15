//
//  ContentView.swift
//  PublishingView
//
//  Created by Ricardo Li on 2022/8/18.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var showMaskView: Bool = false

    var body: some View {
        ZStack {
            VStack {
                topBarMenu()
                Spacer()
            }

            if showMaskView {
                MaskView(showMaskView: $showMaskView)
                SlideOutMenu(showMaskView: $showMaskView)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            }
        }
    }

    // 搜索栏
    func topBarMenu() -> some View {
        HStack(spacing: 15) {
            // 直播
            Button(action: {
            }) {
                Image(systemName: "video.square")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
            }

            TextField("搜索文如秋雨", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading, 8)
                )

            // 新建发布
            Button(action: {
                withAnimation {
                    self.showMaskView = true
                }
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.blue)
            }

        }.padding(.horizontal, 15)
    }
}

// MARK: 底部弹窗

struct SlideOutMenu: View {
    @Binding var showMaskView: Bool
    @State private var offsetY = CGSize.zero
    @State var isAllowToDrag: Bool = false

    var body: some View {
        VStack {
            Spacer()

            VStack {
                // 下拉条
                pullDownBtnView()

                Spacer()

                // 操作按钮
                HStack(spacing: 20) {
                    operateBtnView(image: "magazine.fill", text: "写文章")
                    operateBtnView(image: "doc.plaintext.fill", text: "发沸点")
                    operateBtnView(image: "book.fill", text: "提问题")
                    operateBtnView(image: "paperplane.fill", text: "传资源")
                }
                Spacer()

                // 关闭按钮
                colseBtnView()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 320)
            .background(Color.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: isAllowToDrag ? offsetY.height : 0)
            .gesture(
                DragGesture()
                    .onChanged { gesture in

                        // 如果向下拖动
                        if gesture.translation.height > 0 {
                            self.isAllowToDrag = true
                            self.offsetY = gesture.translation
                        }
                    }

                    .onEnded { _ in

                        // 如果拖动位置大于100
                        if (self.offsetY.height) > 100 {
                            self.showMaskView = false
                        } else {
                            self.offsetY = .zero
                        }
                    }
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    // 下拉条
    func pullDownBtnView() -> some View {
        Rectangle()
            .foregroundColor(Color(.systemGray4))
            .cornerRadius(30)
            .frame(width: 50, height: 5)
    }

    // 操作功能
    func operateBtnView(image: String, text: String) -> some View {
        Button(action: {
            self.showMaskView = false
        }) {
            VStack(spacing: 15) {
                Image(systemName: image)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .frame(width: 80, height: 80)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Text(text)
                    .font(.system(size: 17))
                    .foregroundColor(.black)
            }
        }
    }

    // 关闭按钮
    func colseBtnView() -> some View {
        Button(action: {
            self.showMaskView = false
        }) {
            Image(systemName: "xmark")
                .font(.system(size: 24))
                .foregroundColor(.gray)
                .padding(.bottom, 20)
        }
    }
}

// MARK: 蒙层

struct MaskView: View {
    @Binding var showMaskView: Bool

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(.black)
        .edgesIgnoringSafeArea(.all)
        .opacity(0.2)
        .onTapGesture {
            self.showMaskView = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
