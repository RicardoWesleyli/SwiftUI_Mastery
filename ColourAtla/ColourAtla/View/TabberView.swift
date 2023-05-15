//
//  TabberView.swift
//  ColourAtla
//
//  Created by Ricardo Li on 2022/7/8.
//

import SwiftUI

struct TabberView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            CardView()
                .tabItem {
                    if self.selectedTab == 0 {
                        Image(systemName: "square.text.square")
                    } else {
                        Image(systemName: "square.text.square.fill")
                    }
                    Text("色卡")
                }
                .tag(0)
            
            GradientView()
                .tabItem {
                    if self.selectedTab == 1 {
                        Image(systemName: "square.grid.2x2")
                    } else {
                        Image(systemName: "square.grid.2x2.fill")
                    }
                    Text("渐变色")
                }
                .tag(1)
            
            LogoView()
                .tabItem {
                    if self.selectedTab == 2 {
                        Image(systemName: "icloud.square")
                    } else {
                        Image(systemName: "icloud.square.fill")
                    }
                    Text("LOGO")
                }
                .tag(2)

            MineView()
                .tabItem {
                    if self.selectedTab == 3 {
                        Image(systemName: "person")
                    } else {
                        Image(systemName: "person.fill")
                    }
                    Text("我的")
                }
                .tag(3)
        }
        .accentColor(Color.Hex(0x409EFF))
    }
}


struct TabberView_Previews: PreviewProvider {
    static var previews: some View {
        TabberView()
    }
}

