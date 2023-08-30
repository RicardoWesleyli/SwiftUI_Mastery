//
//  ImageBtnView.swift
//  Chapter6
//

import SwiftUI

struct ImageBtnView: View {
    var body: some View {
        Button(action: {
            // 点击后的操作
        }) {
            Image("WoodenFish")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
        }
    }
}

struct ImageBtnView_Previews: PreviewProvider {
    static var previews: some View {
        ImageBtnView()
    }
}
