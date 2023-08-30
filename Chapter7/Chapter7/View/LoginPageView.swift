//
//  LoginPageView.swift
//  Chapter7
//

import SwiftUI

struct LoginPageView: View {
    @State var phoneText: String = ""
    @State var secureText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 60) {
                // 示例图片
                Image("DefaultImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                VStack(spacing: 20) {
                    // 文本框
                    TextField("请输入手机号", text: $phoneText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.telephoneNumber)
                        .keyboardType(.numberPad)
                        .disableAutocorrection(true)
                    
                    // 安全文本框
                    SecureField("请输入密码", text: $secureText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
            
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
