//
//  NewNoteView.swift
//  IdeaNote
//
//  Created by Ricardo Li on 2022/9/19.
//

import SwiftUI

struct NewNoteView: View {
    // 引用viewModel
    @EnvironmentObject var viewModel: ViewModel

    // 声明参数
    @State var noteModel: NoteModel

    // 关闭弹窗
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Divider()
                titleView()
                Divider()
                contentView()
            }
            .navigationBarTitle(viewModel.isAdd ? "新建笔记" : "编辑笔记", displayMode: .inline)
            .navigationBarItems(leading: closeBtnView(), trailing: saveBtnView())
            .toast(present: $viewModel.showToast, message: $viewModel.showToastMessage)
        }
    }

    // MARK: 关闭按钮

    func closeBtnView() -> some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 17))
                .foregroundColor(.gray)
        }
    }

    // MARK: 完成按钮

    func saveBtnView() -> some View {
        Button(action: {
            //判断当前是新增还是编辑
            if viewModel.isAdd {
                //判断标题是否为空
                if viewModel.isTextEmpty(text: viewModel.title) {
                    viewModel.showToast = true
                    viewModel.showToastMessage = "请输入标题"
                }
                
                //判断内容是否为空
                else if viewModel.isTextEmpty(text: viewModel.content) {
                    viewModel.showToast = true
                    viewModel.showToastMessage = "请输入内容"
                }
                
                //校验通过
                else {
                    // 新增一条笔记
                    self.viewModel.addItem(writeTime: viewModel.getCurrentTime(), title: viewModel.title, content: viewModel.content)
                    //关闭弹窗
                    self.presentationMode.wrappedValue.dismiss()
                }

            } else {
                
                //判断标题是否为空
                if viewModel.isTextEmpty(text: noteModel.title) {
                    viewModel.showToast = true
                    viewModel.showToastMessage = "标题不能为空"
                }
                
                //判断内容是否为空
                else if viewModel.isTextEmpty(text: noteModel.content) {
                    viewModel.showToast = true
                    viewModel.showToastMessage = "内容不能为空"
                }
                
                //校验通过
                else {
                    // 保存一条新笔记
                    self.viewModel.editItem(item: noteModel)
                    
                    //关闭弹窗
                    self.presentationMode.wrappedValue.dismiss()
                }
            }

        }) {
            Text("完成")
                .font(.system(size: 17))
        }
    }

    // MARK: 标题输入框

    func titleView() -> some View {
        TextField("请输入标题", text: viewModel.isAdd ? $viewModel.title : $noteModel.title)
            .padding()
    }

    // MARK: 内容输入框

    func contentView() -> some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: viewModel.isAdd ? $viewModel.content : $noteModel.content)
                .font(.system(size: 17))
                .padding()
            if viewModel.isAdd ? (viewModel.content.isEmpty) : (noteModel.content.isEmpty) {
                Text("请输入内容")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(20)
            }
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(noteModel: NoteModel(writeTime: "", title: "", content: "")).environmentObject(ViewModel())
    }
}
