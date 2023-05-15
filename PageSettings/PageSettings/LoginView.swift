//
//  LoginView.swift
//  PageSettings
//
//  Created by Ricardo Li on 2022/9/5.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 400) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("开启你的意识世界")
                        .font(.title)
                        .bold()
                    Text("首次登录自动创建新账号")
                        .font(.system(size: 17))
                }

                VStack(alignment: .center, spacing: 40) {
                    VStack(alignment: .center, spacing: 15) {
                        Button(action: {
                            viewModel.isLogin = true
                        }) {
                            Text("手机号码登录")
                                .font(.system(size: 17))
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(.red)
                                .cornerRadius(8)
                        }

                        Button(action: {}) {
                            Text("微信登录")
                                .font(.system(size: 17))
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(8)
                        }
                    }

                    HStack {
                        Text("登录即表明同意")
                            .foregroundColor(.white)

                        Button(action: {}) {
                            Text("用户协议")
                        }

                        Text("和")
                            .foregroundColor(.white)

                        Button(action: {}) {
                            Text("隐私政策")
                        }
                    }
                }
            }.padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
