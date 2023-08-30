//
//  SwiftUINavigationView.swift
//  Chapter10
//

import SwiftUI

struct SwiftUINavigationView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AccountSettingView()) {
                    SettingBtn(btnImage: "person", btnName: "账号设置")
                }
                SettingBtn(btnImage: "lock", btnName: "隐私设置")
                SettingBtn(btnImage: "paintpalette", btnName: "主题模式")
                SettingBtn(btnImage: "exclamationmark.square", btnName: "偏好设置")
                SettingBtn(btnImage: "questionmark.circle", btnName: "关于我们")
                Spacer()
            }
            .padding(.top)
            .navigationBarTitle("设置", displayMode: .inline)
        }
    }
}

// 侧滑返回拓展
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

struct SwiftUINavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigationView()
    }
}
