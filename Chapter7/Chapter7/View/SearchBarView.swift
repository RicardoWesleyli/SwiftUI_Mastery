//
//  SearchBarView.swift
//  Chapter7
//

import SwiftUI

struct SearchBarView: View {
    @State var inputText: String = ""

    var body: some View {
        VStack {
            TextField("搜索内容", text: $inputText)
                .padding(10)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading, 8)
                )
                .padding()
            Spacer()
        }
        // 点击时
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
