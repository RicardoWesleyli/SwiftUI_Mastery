//
//  SwiftUIPickerView.swift
//  Chapter11
//

import SwiftUI

struct SwiftUIPickerView: View {
    private var selectedItem = ["推荐", "销量", "评分", "折扣"]
    @State private var selectedNumber = 0

    var body: some View {
        Form {
            Picker("排序", selection: $selectedNumber) {
                ForEach(0 ..< selectedItem.count, id: \.self) {
                    Text(self.selectedItem[$0])
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct SwiftUIPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPickerView()
    }
}
