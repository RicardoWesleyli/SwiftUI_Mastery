//
//  SwiftUIPopover.swift
//  Chapter12
//

import SwiftUI

struct SwiftUIPopover: View {
    @State var noteModels = NoteModels
    @State var showAddNoteView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(noteModels) { item in
                    Text(item.content)
                }
            }
            .navigationBarTitle("笔记", displayMode: .inline)
            .navigationBarItems(trailing: newBtn)
        }
        .sheet(isPresented: $showAddNoteView) {
            AddNoteView(noteModels: $noteModels)
         }
    }

    // 新增按钮
    private var newBtn: some View {
        Button(action: {
            self.showAddNoteView.toggle()
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 20))
        }
    }
}

struct SwiftUIPopover_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPopover()
    }
}
