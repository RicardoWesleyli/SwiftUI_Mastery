//
//  SystemBtnView.swift
//  Chapter6
//

import SwiftUI

struct SystemBtnView: View {
    var body: some View {
        Button(action: {
            // 点击后的操作
        }) {
            Image(systemName: "trash")
        }
    }
}

struct SystemBtnView_Previews: PreviewProvider {
    static var previews: some View {
        SystemBtnView()
    }
}
