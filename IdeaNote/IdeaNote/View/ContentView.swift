//
//  ContentView.swift
//  IdeaNote
//
//  Created by Ricardo Li on 2022/9/17.
//

import SwiftUI

struct ContentView: View {
    // 引用viewModel
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isSearching == false && viewModel.noteModels.count == 0 {
                    noDataView()

                } else {
                    VStack {
                        searchBarView()
                        noteListView()
                    }
                }
                newBtnView()
            }
            .navigationBarTitle("念头笔记", displayMode: .inline)
        }
        .sheet(isPresented: $viewModel.showNewNoteView) {
            NewNoteView(noteModel: NoteModel(writeTime: "", title: "", content: ""))
        }
    }

    // MARK: 缺省图

    func noDataView() -> some View {
        VStack(alignment: .center, spacing: 20) {
            Image("mainImage")
                .resizable()
                .scaledToFit()
                .frame(width: 240)
            Text("记录下这个世界的点滴")
                .font(.system(size: 17))
                .bold()
                .foregroundColor(.gray)
        }
    }

    // MARK: 新建笔记按钮

    func newBtnView() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.viewModel.isAdd = true
                    self.viewModel.writeTime = viewModel.getCurrentTime()
                    self.viewModel.title = ""
                    self.viewModel.content = ""
                    self.viewModel.showNewNoteView = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.bottom, 32)
        .padding(.trailing, 32)
    }

    // MARK: 搜索栏

    func searchBarView() -> some View {
        TextField("搜索内容", text: $viewModel.searchText)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)

                    // 编辑时显示清除按钮
                    if viewModel.searchText != "" {
                        Button(action: {
                            self.viewModel.searchText = ""
                            self.viewModel.loadItems()
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .padding(.horizontal, 10)
            .onChange(of: viewModel.searchText) { _ in
                if viewModel.searchText != "" {
                    self.viewModel.isSearching = true
                    self.viewModel.searchContet()
                } else {
                    viewModel.searchText = ""
                    self.viewModel.isSearching = false
                    self.viewModel.loadItems()
                }
            }
    }

    // MARK: 笔记列表

    func noteListView() -> some View {
        List {
            ForEach(viewModel.noteModels) { noteItem in
                NoteListRow(itemId: noteItem.id)
            }
        }
        .listStyle(InsetListStyle())
    }
}

// MARK: 单条笔记

struct NoteListRow: View {
    // 引用viewModel
    @EnvironmentObject var viewModel: ViewModel

    // 获得项目唯一ID
    var itemId: UUID

    // 从模型类中找ID
    var item: NoteModel? {
        return viewModel.getItemById(itemId: itemId)
    }

    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(item?.writeTime ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text(item?.title ?? "")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    Text(item?.content ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                }
            }
            // 点击编辑
            .onTapGesture {
                self.viewModel.isAdd = false
                self.viewModel.showEditNoteView = true
            }

            Spacer()

            // 更多操作
            Button(action: {
                viewModel.showActionSheet = true
            }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
                    .font(.system(size: 23))
            }
        }

        // 编辑笔记
        .sheet(isPresented: $viewModel.showEditNoteView) {
            NewNoteView(noteModel: self.item ?? NoteModel(writeTime: "", title: "", content: ""))
        }

        // 删除笔记
        .actionSheet(isPresented: self.$viewModel.showActionSheet) {
            ActionSheet(
                title: Text("你确定要删除此项吗？"),
                message: nil,
                buttons: [
                    .destructive(Text("删除"), action: {
                        self.viewModel.deleteItem(itemId: itemId)
                    }),
                    .cancel(Text("取消")),
                ])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
