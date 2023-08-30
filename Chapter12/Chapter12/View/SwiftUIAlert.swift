//
//  SwiftUIAlert.swift
//  Chapter12
//

import SwiftUI

struct SwiftUIAlert: View {
    @State var showDeleteAlert: Bool = false
    
    var body: some View {
        Button(action: {
            self.showDeleteAlert.toggle()
        }) {
            HStack {
                Image(systemName: "trash.fill")
                Text("删除")
            }
            .foregroundColor(.red)
        }
        // 打开警告弹窗
        .alert(isPresented: $showDeleteAlert, content: { deleteAlert })
    }

    // 警告弹窗
    private var deleteAlert: Alert {
        let alert = Alert(title: Text(""),
                          message: Text("确定要删除吗？"),
                          primaryButton: .destructive(Text("确认")) {
                              // 删除内容
                          },
                          secondaryButton: .cancel(Text("取消")))
        return alert
    }
}

struct SwiftUIAlert_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAlert()
    }
}
