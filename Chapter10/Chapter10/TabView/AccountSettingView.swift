//
//  AccountSettingView.swift
//  Chapter10
//

import SwiftUI

struct AccountSettingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Hello, World!")
            .navigationBarTitle("账号设置", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backBtn)
    }

    // 返回按钮
    private var backBtn: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                Text("返回")
            }
            .foregroundColor(.black)
        }
    }
}

struct AccountSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingView()
    }
}
