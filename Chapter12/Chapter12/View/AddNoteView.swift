//
//  AddNoteView.swift
//  Chapter12
//

import SwiftUI

struct AddNoteView: View {
    @State var content: String = ""
    @Binding var noteModels:[NoteModel]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                TextField("请输入内容", text: $content)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Spacer()
            }
            .navigationBarTitle("新增笔记", displayMode: .inline)
            .navigationBarItems(leading: closeBtn, trailing: saveBtn)
        }
    }

    // 关闭页面按钮
    private var closeBtn: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(Color(.systemGray3))
        }
    }

    // 保存按钮
    private var saveBtn: some View {
        Button(action: {
            if !content.isEmpty{
                noteModels.append(NoteModel(content: content))
                self.presentationMode.wrappedValue.dismiss()
            }
        }) {
            Text("保存")
                .font(.system(size: 17))
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView(noteModels: .constant([NoteModel]()))
    }
}
