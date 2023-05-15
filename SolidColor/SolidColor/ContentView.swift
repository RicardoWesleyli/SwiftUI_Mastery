//
//  ContentView.swift
//  SolidColor
//
//  Created by Ricardo Li on 2022/7/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ForEach(models) { item in
                ZStack {
                    item.color.edgesIgnoringSafeArea(.all)

                    VStack(alignment: .center, spacing: 20) {
                        Text(item.colorName)
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text(item.colorRGBName)
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Model: Identifiable {
    var id = UUID()
    var colorName: String
    var color: Color
    var colorRGBName: String
}

var models = [
    Model(colorName: "草莓红", color: Color(red: 228 / 255, green: 45 / 255, blue: 68 / 255), colorRGBName: "#E42D44"),
    Model(colorName: "奶油白", color: Color(red: 250 / 255, green: 239 / 255, blue: 222 / 255), colorRGBName: "#FAEFDE"),
    Model(colorName: "泥猴桃绿", color: Color(red: 123 / 255, green: 173 / 255, blue: 95 / 255), colorRGBName: "#7BAD5F"),
    Model(colorName: "小麦黄", color: Color(red: 229 / 255, green: 215 / 255, blue: 173 / 255), colorRGBName: "#E5D7AD"),
    Model(colorName: "板栗灰", color: Color(red: 97 / 255, green: 79 / 255, blue: 77 / 255), colorRGBName: "#614F4D"),
    Model(colorName: "柠檬黄", color: Color(red: 255 / 255, green: 216 / 255, blue: 0 / 255), colorRGBName: "#FFD800"),
    Model(colorName: "葡萄紫", color: Color(red: 91 / 255, green: 52 / 255, blue: 99 / 255), colorRGBName: "#5B3663"),
    Model(colorName: "青豆绿", color: Color(red: 188 / 255, green: 207 / 255, blue: 144 / 255), colorRGBName: "#BCCF90"),
    Model(colorName: "水蜜桃粉", color: Color(red: 246 / 255, green: 160 / 255, blue: 154 / 255), colorRGBName: "#F6A09A"),
]
