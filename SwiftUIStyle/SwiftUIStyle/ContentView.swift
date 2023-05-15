//
//  ContentView.swift
//  SwiftUIStyle
//

import SwiftUI

struct ContentView: View {
    @State var userName: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    
    @State var showToast = false
    @State var showToastMessage: String = ""

    var body: some View {
        VStack {
            Spacer()
            // 素材
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
            // 按钮
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

// Toast修饰符
struct ToastView: ViewModifier {
    @Binding var present: Bool
    @Binding var message: String
    var alignment: Alignment = .center

    func body(content: Content) -> some View {
        ZStack {
            // 视图
            content
                .zIndex(0)

            // Toast
            VStack {
                Text(message)
                    .padding(Edge.Set.horizontal, 20)
                    .padding(Edge.Set.vertical, 10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .background(Color.gray.opacity(0.1))
            .opacity(present ? 1 : 0)
            .zIndex(1)
            .onChange(of: present) { value in
                if value {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        present.toggle()
                    }
                }
            }
        }
    }
}

// 视图修饰符拓展
extension View {
    func textFieldStyle() -> some View {
        modifier(TextFieldStyle())
    }

    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }

    func toast(present: Binding<Bool>, message: Binding<String>, alignment: Alignment = .center) -> some View {
        modifier(ToastView(present: present, message: message, alignment: alignment))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
