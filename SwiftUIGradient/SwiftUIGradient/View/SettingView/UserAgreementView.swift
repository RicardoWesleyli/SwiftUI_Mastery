//
//  UserAgreementView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/7/1.
//

import SwiftUI
import WebKit

struct UserAgreementView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Divider()
                Spacer()
                UserAgreementSiteView()
            }

            .navigationBarTitle(Text(Constants.userAgreementViewName), displayMode: .inline)
            .navigationBarItems(trailing: closeBtnView)
        }
    }

    // MARK: - 关闭

    private var closeBtnView: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: Constants.clearButton)
                .foregroundColor(Color.gray)
        }
    }
}

// MARK: - 网页方法

struct UserAgreementSiteView: UIViewRepresentable, View {
    func makeUIView(context: UIViewRepresentableContext<UserAgreementSiteView>) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<UserAgreementSiteView>) {
        let request = URLRequest(url: URL(string: Constants.userAgreementSite)!)
        uiView.load(request)
    }
}
