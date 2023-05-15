//
//  ContentView.swift
//  ToDo
//
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entity.id, ascending: true)],
        animation: .default)
    private var todoItems: FetchedResults<Entity>

    var body: some View {
        VStack {
            // ToDo列表
            List {
                ForEach(todoItems) { todoItem in
                    ToDoListRow(todoItem: todoItem)
                        .onTapGesture {
                            toggleTodoItemCompleted(itemId: todoItem.id)
                        }
                        .contextMenu {
                            Button("删除") {
                                deleteTodoItem(itemId: todoItem.id)
                            }
                        }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())

            // 文本输入
            InputTextField()
        }
    }

    // 点击完成事项方法
    func toggleTodoItemCompleted(itemId: UUID) {
        if let toggleItem = todoItems.first(where: { $0.id == itemId }) {
            toggleItem.isCompleted.toggle()

            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }

    // 删除事项方法
    func deleteTodoItem(itemId: UUID) {
        if let deleteItem = todoItems.first(where: { $0.id == itemId }) {
            viewContext.delete(deleteItem)

            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
}

// 展示内容
struct ToDoListRow: View {
//    var todoItem: Entity
    @ObservedObject var todoItem: Entity

    var body: some View {
        HStack {
            Text(todoItem.todoItem)
                .foregroundColor(todoItem.isCompleted ? .gray : .black)
                .lineLimit(1)
                .strikethrough(todoItem.isCompleted, color: .gray)

            Spacer()

            Image(systemName: todoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(todoItem.isCompleted ? .green : .black)
        }
        .padding(.horizontal)
        .frame(height: 75)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

// 输入内容
struct InputTextField: View {
    @State var newTodoItem = ""
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        HStack {
            TextField("添加新事项", text: $newTodoItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Image(systemName: "plus.circle.fill")
                .font(.system(size: 28))
                .foregroundColor(.blue)
                // 点击新增笔记
                .onTapGesture {
                    addTodoItem()
                }
        }
        .padding()
    }

    // 新增事项方法
    func addTodoItem() {
        if !newTodoItem.isEmpty {
            let newItem = Entity(context: viewContext)
            newItem.id = UUID()
            newItem.todoItem = newTodoItem
            newItem.isCompleted = false
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
            newTodoItem = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
