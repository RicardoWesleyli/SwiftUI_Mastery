//
//  SettingBtn.swift
//  Chapter9
//

import SwiftUI

struct SettingBtn: View {
    var btnImage: String
    var btnName: String

    var body: some View {
        HStack {
            HStack(spacing: 10) {
                Image(systemName: btnImage)
                    .font(.system(size: 17))
                    .foregroundColor(Color.black)
                Text(btnName)
                    .font(.system(size: 17))
                    .foregroundColor(Color.black)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 17))
                .foregroundColor(Color(.systemGray2))
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 68)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

struct SettingBtn_Previews: PreviewProvider {
    static var previews: some View {
        SettingBtn(btnImage: "person", btnName: "账号设置")
    }
}
