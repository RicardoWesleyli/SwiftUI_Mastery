//
//  SwiftUINetworkRequest.swift
//  Chapter17
//

import SwiftUI

// 示例数据
// var colors = [
//    ColorModel(id: 1, color: "F6C5B5"),
//    ColorModel(id: 2, color: "DCA090"),
//    ColorModel(id: 3, color: "D77E66"),
//    ColorModel(id: 4, color: "B05A46"),
//    ColorModel(id: 5, color: "D1CCC7"),
//    ColorModel(id: 6, color: "C8B3B2"),
//    ColorModel(id: 7, color: "928187"),
//    ColorModel(id: 8, color: "5A4E56")
// ]

struct SwiftUINetworkRequest: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.colors.shuffled()) { item in
                    CardItem(cardName: "#" + item.color,
                             cardColor: Color(hex: item.color))
                }
            }
            .navigationTitle("ColorCard")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// 色卡组件
struct CardItem: View {
    var cardName: String
    var cardColor: Color

    var body: some View {
        Text(cardName)
            .font(.system(size: 23))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(cardColor)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct SwiftUINetworkRequest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINetworkRequest(viewModel: ViewModel())
    }
}
