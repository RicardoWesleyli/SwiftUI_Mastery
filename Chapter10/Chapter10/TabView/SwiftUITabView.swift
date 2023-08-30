//
//  SwiftUITabView.swift
//  Chapter10
//

import SwiftUI

struct SwiftUITabView: View {
    @State var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            IndexView()
                .tabItem {
                    Image(selectedTab == 0 ? "house.fill":"house")
                    Text("首页")
                }
                .tag(0)

            SwiftUINavigationView()
                .tabItem {
                    Image(selectedTab == 1 ?"gearshape.fill":"gearshape")
                    Text("设置")
                }
                .tag(1)
        }
        .accentColor(.red)
    }
}

struct SwiftUITabView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITabView()
    }
}
