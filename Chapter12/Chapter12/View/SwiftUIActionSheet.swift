//
//  SwiftUIActionSheet.swift
//  Chapter12
//

import SwiftUI

struct SwiftUIActionSheet: View {
    @State var showActionSheet:Bool = false
    
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }) {
            VStack(spacing: 15) {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.system(.title))
                    .foregroundColor(Color(.systemGray2))
                Text("上传图片")
                    .foregroundColor(Color(.systemGray2))
            }
            .padding(20)
            .background(Color(.systemGray6))
            .cornerRadius(16)
        }
        .actionSheet(isPresented: $showActionSheet, content: { actionSheet })
    }

    // 选项弹窗
    private var actionSheet: ActionSheet {
        let action = ActionSheet(title: Text("更多操作")
                                 , buttons: [
                                     .default(Text("相机拍照"), action: {
                                         // 打开相机
                                     }),
                                     .destructive(Text("相册上传"), action: {
                                         // 打开相册
                                     }),
                                     .cancel(Text("取消"), action: {
                                         // 关闭弹窗时的附加操作
                                     }),
                                 ])

        return action
    }
}

struct SwiftUIActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIActionSheet()
    }
}
