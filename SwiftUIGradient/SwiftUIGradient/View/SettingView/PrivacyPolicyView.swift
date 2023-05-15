//
//  PrivacyPolicyView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/7/1.
//

import SwiftUI
import WebKit

struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Divider()
                Spacer()
                PrivacyPolicySiteView()

            }

            .navigationBarTitle(Text(Constants.privacyPolicyViewName), displayMode: .inline)
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

struct PrivacyPolicySiteView: UIViewRepresentable, View {
    func makeUIView(context: UIViewRepresentableContext<PrivacyPolicySiteView>) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<PrivacyPolicySiteView>) {
        let request = URLRequest(url: URL(string: Constants.privacyPolicySite)!)
        uiView.load(request)
    }
}
