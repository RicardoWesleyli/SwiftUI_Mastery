//
//  Model.swift
//  ToDo
//
//

import SwiftUI

struct TodoModel: Identifiable {
    var id: UUID = UUID()
    var todoItem: String
    var isCompleted: Bool

    init(todoItem: String) {
        self.todoItem = todoItem
        isCompleted = false
    }
}
