//
//  ShareLink.swift
//  SwiftUISkill
//
//  Created by Ricardo Li on 2022/7/15.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)

        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}

struct ShareLinkView: View {
    let items = ["https://juejin.cn/user/3897092103223517"]
    @State var showingSheet: Bool = false

    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.up")
            Text("分享")
        }
        .onTapGesture {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            ShareSheet(items: items)
        }
    }
}

struct ShareLink_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkView()
    }
}
