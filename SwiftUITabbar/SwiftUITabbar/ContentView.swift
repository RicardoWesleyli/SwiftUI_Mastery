//
//  ContentView.swift
//  SwiftUITabbar
//
//  Created by Ricardo Li on 2022/6/28.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView{
                Text("首页")
                    .tabItem{
                        Image(systemName: "house.fill")
                    }
                
                Text("搜索")
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                
                Text("喜欢")
                    .tabItem{
                        Image(systemName: "suit.heart.fill")
                    }
                
                Text("我的")
                    .tabItem{
                        Image(systemName: "person.circle.fill")
                    }
            }
            .navigationTitle("底部导航")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    }label: {
                        Image(systemName: "paperplane")
                            .font(.callout)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


