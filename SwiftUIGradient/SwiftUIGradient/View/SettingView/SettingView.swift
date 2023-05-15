//
//  SettingView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import MessageUI
import SwiftUI

struct SettingView: View {
    @State var showPrivacyPolicyView: Bool = false
    @State var showUserAgreementView: Bool = false
    @State var showAboutView: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    toOurSiteView
                    toPrivacyPolicyView
                    toUserAgreementView
                }
                Section {
                    toAppStoreView
                    toFeedbackView
                    toAboutView
                }
            }
            .padding(.top, -20)
            .navigationBarTitle("设置", displayMode: .inline)
        }
        // 显示分割线
        .onAppear {
            UITableView.appearance().separatorColor = .systemGray4
        }
    }

    // MARK: - 访问官网

    private var toOurSiteView: some View {
        Button(action: {
            guard let url = URL(string: Constants.officialWebsite), UIApplication.shared.canOpenURL(url) else {
                return
            }
            UIApplication.shared.open(url as URL)
        }) {
            HStack {
                Text("访问官网")
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
    }

    // MARK: - 前往隐私政策页面

    private var toPrivacyPolicyView: some View {
        Button(action: {
            self.showPrivacyPolicyView.toggle()
        }) {
            HStack {
                Text("隐私政策")
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $showPrivacyPolicyView) {
                PrivacyPolicyView()
            }
        }
    }

    // MARK: - 前往用户协议页面

    private var toUserAgreementView: some View {
        Button(action: {
            self.showUserAgreementView.toggle()
        }) {
            HStack {
                Text("用户协议")
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $showUserAgreementView) {
                UserAgreementView()
            }
        }
    }

    // MARK: - 前往Appstore评分页面

    private var toAppStoreView: some View {
        Button(action: {
            gotoAppStore(appId: Constants.appId)
        }) {
            HStack {
                Text("前往AppStore")
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
    }

    // MARK: - 前往帮助反馈页面

    private var toFeedbackView: some View {
        Button(action: {
        }) {
            HStack {
                Text("用户反馈")
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
    }

    // MARK: - 前往关于页面

    private var toAboutView: some View {
        Button(action: {
            self.showAboutView.toggle()
        }) {
            HStack {
                Text("关于我们")
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .sheet(isPresented: $showAboutView) {
            AboutView()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
