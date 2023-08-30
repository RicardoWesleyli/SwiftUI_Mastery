//
//  ContentView.swift
//  ToDo
//

import SwiftUI

struct ContentView: View {
//    @State var todoItems: [ToDoModel] = [
//        ToDoModel(todoItem: "阅读1小时"),
//        ToDoModel(todoItem: "跑步5公里"),
//    ]
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entity.id, ascending: true)],
        animation: .default)
    private var todoItems: FetchedResults<Entity>

    var body: some View {
        VStack {
            List {
                ForEach(todoItems) { todoItem in
                    ToDoListRow(todoItem: todoItem)
                        .onTapGesture {
                            toggleToDoItemCompleted(itemId: todoItem.id)
                        }
                        .contextMenu {
                            Button("删除") {
                                deleteToDoItem(itemId:todoItem.id)
                            }
                        }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            
            InputTextField()
        }
    }
    
    func toggleToDoItemCompleted(itemId: UUID) {
        guard let todoItem = todoItems.first(where: { $0.id == itemId }) else { return }

        withAnimation {
            todoItem.isCompleted.toggle()
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    func deleteToDoItem(itemId: UUID) {
        if let deleteItem = todoItems.first(where: { $0.id == itemId }) {
            viewContext.delete(deleteItem)
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
//    // 点击完成事项方法
//    func toggleToDoItemCompleted(_ todoItem: ToDoModel) {
//        if let index = todoItems.firstIndex(where: { $0.id == todoItem.id }) {
//            todoItems[index].isCompleted.toggle()
//        }
//    }

//    // 删除事项方法
//    func deleteToDoItem(at offsets: IndexSet) {
//        todoItems.remove(atOffsets: offsets)
//    }
}
// 展示内容
struct ToDoListRow: View {
    var todoItem: Entity

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
    @State var newToDoItem = ""
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        HStack {
            TextField("添加新事项", text: $newToDoItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Image(systemName: "plus.circle.fill")
                .font(.system(size: 28))
                .foregroundColor(.blue)
                .onTapGesture {
                    addTodoItem()
                }
        }
        .padding()
    }
    
    // 新增笔记方法
    func addTodoItem() {
        if !newToDoItem.isEmpty {
            let newItem = Entity(context: viewContext)
            newItem.id = UUID()
            newItem.todoItem = newToDoItem
            newItem.isCompleted = false
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
            newToDoItem = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
