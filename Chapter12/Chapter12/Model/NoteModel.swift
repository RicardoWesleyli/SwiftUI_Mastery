//
//  NoteModel.swift
//  Chapter12
//

import SwiftUI

struct NoteModel: Identifiable {
    var id: UUID = UUID()
    var content: String
}

// 示例数据
var NoteModels = [
    NoteModel(content: "这是一条笔记。")
]
