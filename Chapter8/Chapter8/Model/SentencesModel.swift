//
//  SentencesModel.swift
//  Chapter8
//

import SwiftUI

struct SentencesModel: Identifiable {
    var id: UUID = UUID()
    var image: String
    var text: String
}

// 演示数据
var Sentences: [SentencesModel] = [
    SentencesModel(image: "icon_weixin", text: "微信帐号"),
    SentencesModel(image: "icon_qq", text: "QQ帐号"),
    SentencesModel(image: "icon_weibo", text: "新浪微博"),
    SentencesModel(image: "icon_xiaohongshu", text: "小红书"),
    SentencesModel(image: "icon_douyin", text: "抖音帐号"),
    SentencesModel(image: "icon_bilibili", text: "哔哩哔哩"),
    SentencesModel(image: "icon_zhihu", text: "知乎帐号"),
]
