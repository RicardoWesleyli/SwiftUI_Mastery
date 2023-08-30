//
//  DisclosureGroupView.swift
//  Chapter13
//

import SwiftUI

struct DisclosureGroupView: View {
    private let helpCenterContent = [
        (
            question: "如何修改密码",
            answer: "进入「设置页」，点击「头像」-「昵称」进入账户信息页，点击「修改密码」。"
        ), (
            question: "如何注销账户？",
            answer: "进入「设置」，点击「头像」-「昵称」进入账户信息页，点击「删除账号」，完成操作引导即可注销账号。"
        ),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(helpCenterContent.indices, id: \.self) { item in
                HelpCenterItem(
                    question: helpCenterContent[item].question,
                    answer: helpCenterContent[item].answer
                )
            }
        }
    }
}

// Q&A组件
struct HelpCenterItem: View {
    var question: String
    var answer: String

    var body: some View {
        DisclosureGroup(question) {
            Text(answer)
                .font(.system(size: 14))
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}
