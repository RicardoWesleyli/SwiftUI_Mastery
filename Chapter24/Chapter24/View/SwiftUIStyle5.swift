//
//  SwiftUIStyle5.swift
//  Chapter24
//

import SwiftUI

struct SwiftUIStyle5: View {
    @State var userName: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var showToast = false
    @State var showToastMessage: String = ""

    var body: some View {
        VStack {
            Spacer()
            Image("Tea")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Spacer()
            TextField("请输入用户名", text: $userName)
                .textFieldStyle()
            TextField("请输入密码", text: $password)
                .textFieldStyle()
            TextField("请再次输入密码", text: $passwordConfirm)
                .textFieldStyle()
            Spacer()
            
            Text("立即注册")
                .buttonStyle()
                .onTapGesture {
                    self.showToast.toggle()
                    self.showToastMessage = "注册成功"
                }
        }
        .toast(present: $showToast, message: $showToastMessage,alignment: .center)
    }
}
// 文本框修饰符
struct TextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

// 视图修饰符拓展
extension View {
    func textFieldStyle() -> some View {
        modifier(TextFieldStyle())
    }
}

// 按钮修饰符
struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

// 视图修饰符拓展
extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}

struct SwiftUIStyle5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStyle5()
    }
}
