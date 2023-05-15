//
//  ContentView.swift
//  SwiftUISkill
//
//  Created by Ricardo Li on 2022/7/15.
//
//

import SwiftUI

struct ContentView: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 132.0 / 255.0, green: 161.0 / 255.0, blue: 255.0 / 255.0).edgesIgnoringSafeArea(.all)

                List {
                    ForEach(1 ... 4, id: \.self) { index in
                        ZStack(alignment: .leading) {
                            NavigationLink(
                                destination: DetailView()) {
                            }
                            .opacity(0)

                            Text("第 \(index)页")
                        }
                    }
                }
            }.navigationTitle("列表")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailView: View {
    var body: some View {
        Text("详情页")
    }
}
