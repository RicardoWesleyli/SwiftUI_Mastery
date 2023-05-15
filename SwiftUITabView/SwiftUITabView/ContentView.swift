//
//  ContentView.swift
//  SwiftUITabView
//
//  Created by Ricardo Li on 2022/8/23.
//

import SwiftUI

struct ContentView: View {
    let menuItems = ["首页", "沸点", "课程", "我的"]
    @State var selectedItem = 0
    @State var isFold: Bool = false
    @Namespace private var Transition

    var body: some View {
        ZStack {
            Color(.systemGray6)

            if isFold {
                unfoldView()

            } else {
                foldView()
            }
        }.edgesIgnoringSafeArea(.all)
    }

    // 收起效果
    func foldView() -> some View {
        Image(systemName: "list.bullet")
            .font(.system(size: 24))
            .frame(minWidth: 0, maxWidth: 60, minHeight: 0, maxHeight: 60)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(30)
            .matchedGeometryEffect(id: "fold", in: Transition)
            .onTapGesture {
                withAnimation(.spring()) {
                    self.isFold.toggle()
                }
            }
    }

    // 展开效果
    func unfoldView() -> some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 24))
                .foregroundColor(.pink)
                .matchedGeometryEffect(id: "fold", in: Transition)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.isFold.toggle()
                    }
                }

            ForEach(menuItems.indices, id: \.self) { index in

                if index == selectedItem {
                    Text(menuItems[index])
                        .font(.system(size: 17))
                        .padding(.horizontal, 15)
                        .foregroundColor(.pink)
                } else {
                    Text(menuItems[index])
                        .font(.system(size: 17))
                        .padding(.horizontal, 15)
                        .foregroundColor(.black)
                        .onTapGesture {
                            selectedItem = index
                        }
                }
            }
        }

        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
        .background(.white)
        .cornerRadius(30)
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
