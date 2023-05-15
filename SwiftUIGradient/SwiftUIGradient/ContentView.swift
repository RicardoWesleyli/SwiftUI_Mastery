//
//  ContentView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = Constants.homeIcon
    @EnvironmentObject private var viewModel: ViewModel

    var body: some View {
        ZStack {
            Color.Hex(0xF6F6F6)
                .edgesIgnoringSafeArea(.all)
            ZStack(alignment: .bottom, content: {
                if selectedTab == Constants.homeIcon {
                    HomeView()
                } else if selectedTab == Constants.searchIcon {
                    GradientView()
                } else if selectedTab == Constants.mineIcon {
                    SettingView()
                }

                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.bottom, 20)

            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
