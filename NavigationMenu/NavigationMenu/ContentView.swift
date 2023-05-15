//
//  ContentView.swift
//  NavigationMenu
//
//  Created by Ricardo Li on 2022/7/12.
//

import SwiftUI

struct ContentView: View {
    let menuItems = ["首页", "发现", "关注", "我的"]
    let menuImages = ["house", "paperplane", "heart", "person.2"]
    @State var selectedItem = 0
    @Namespace private var Transition

    var body: some View {
        ZStack {
            Color(.systemGray3)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(menuItems.indices, id: \.self) { index in
                        if index == selectedItem {
                            VStack {
                                Image(systemName: menuImages[index]+".fill")
                                    .foregroundColor(Color.blue)
                                    .font(.system(size: 24))

                                Text(menuItems[index])
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                    .foregroundColor(.blue)

                            }.matchedGeometryEffect(id: "menuItem", in: Transition)
                        } else {
                            VStack {
                                Image(systemName: menuImages[index])
                                    .foregroundColor(Color(.systemGray4))
                                    .font(.system(size: 24))

                                Text(menuItems[index])
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                    .foregroundColor(Color(.systemGray4))
                            }
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    selectedItem = index
                                }
                            }
                        }
                    }
                }
                    .padding(.horizontal,30)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    .background(Color.white)
                    .cornerRadius(60)
                    .overlay(RoundedRectangle(cornerRadius: 60) .stroke(Color(red: 220/255, green: 223/255, blue: 230/255), lineWidth: 1))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
