//
//  ToDoModel.swift
//  ToDo
//

import SwiftUI

struct ToDoModel: Identifiable {
    var id: UUID = UUID()
    var todoItem: String
    var isCompleted: Bool

    init(todoItem: String) {
        self.todoItem = todoItem
        isCompleted = false
    }
}
