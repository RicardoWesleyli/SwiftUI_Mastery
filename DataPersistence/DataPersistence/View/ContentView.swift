//
//  ContentView.swift
//  DataPersistence
//
//  Created by Ricardo Li on 2023/3/30.
//

import SwiftUI

struct ContentView: View {
    // 引入VM
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.noteModels) { item in
                    NoteCardItemView(id: item.id, content: item.content, updateTime: item.updateTime)
                        .contextMenu {
                            Button("删除") {
                                // 删除笔记
                                viewModel.deleteItem(itemId: item.id)
                            }
                        }

                        // 点击打开弹窗
                        .onTapGesture {
                            viewModel.isEdit = true
                            viewModel.noteID = item.id
                            viewModel.content = item.content
                            viewModel.showNewNoteView.toggle()
                        }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("我的笔记", displayMode: .inline)
            .navigationBarItems(leading: darkModeBtn, trailing: addBtn)
        }

        // 切换深色模式
        .preferredColorScheme(viewModel.darkMode ? .dark : .light)

        // 跳转到详新增笔记页面
        .sheet(isPresented: $viewModel.showNewNoteView) {
            NewNoteView(
                id: viewModel.noteID,
                content: viewModel.content,
                showNewNoteView: $viewModel.showNewNoteView,
                viewModel: viewModel
            )
        }
    }

    // 新增按钮
    private var addBtn: some View {
        Image(systemName: "plus.circle.fill")
            .font(.system(size: 20))
            .foregroundColor(.blue)
            .onTapGesture {
                viewModel.isEdit = false
                viewModel.noteID = UUID()
                viewModel.content = ""
                viewModel.showNewNoteView.toggle()
            }
    }

    // 切换深色模式按钮
    private var darkModeBtn: some View {
        Image(systemName: viewModel.darkMode ? "sun.max.circle.fill" : "moon.circle.fill")
            .font(.system(size: 20))
            .foregroundColor(viewModel.darkMode ? .white : .gray)
            .onTapGesture {
                viewModel.darkMode.toggle()
            }
    }
}

// 笔记卡片
struct NoteCardItemView: View {
    var id: UUID
    var content: String
    var updateTime: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(content)
                    .font(.system(size: 17))
                    .lineLimit(3)

                Spacer()

                HStack {
                    Spacer()
                    Text(updateTime)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding()

            Spacer()
        }

        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 140)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

// 新建文字
struct NewNoteView: View {
    @State var id: UUID
    @State var content: String
    @Binding var showNewNoteView: Bool

    // 引入VM
    var viewModel: ViewModel

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topLeading) {
                    // 多行文本框
                    TextEditor(text: $content)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        )

                    // 提示文字
                    if content.isEmpty {
                        Text("请输入内容")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(10)
                    }
                }
                .frame(height: 320)
                .padding()

                Spacer()
            }
            .navigationBarTitle(viewModel.isEdit ? "编辑笔记":"新增笔记", displayMode: .inline)
            .navigationBarItems(leading: closeBtn, trailing: saveBtn)

            // 切换深色模式
            .preferredColorScheme(viewModel.darkMode ? .dark : .light)
        }
    }

    // 关闭按钮
    private var closeBtn: some View {
        Image(systemName: "xmark.circle.fill")
            .font(.system(size: 20))
            .foregroundColor(.gray)
            .onTapGesture {
                self.showNewNoteView.toggle()
            }
    }

    // 保存文字
    private var saveBtn: some View {
        Text("保存")
            .font(.system(size: 20))
            .foregroundColor(.blue)
            .onTapGesture {
                if viewModel.isEdit {
                    let updateItem = NoteModel(id: id, content: content, updateTime: viewModel.getTime())
                    viewModel.editItem(item: updateItem)
                } else {
                    viewModel.addItem(content: content, updateTime: viewModel.getTime())
                }
                self.showNewNoteView.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
