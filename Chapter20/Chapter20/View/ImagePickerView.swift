//
//  ImagePickerView.swift
//  Chapter20
//

import SwiftUI

struct ImagePickerView: View {
    @State var selectImage: Image?
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera

    var body: some View {
        VStack {
            if selectImage != nil {
                // 用户头像
                selectImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .clipShape(Circle())
                    .onTapGesture {self.showImagePicker.toggle()}
            } else {
                // 系统默认头像
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color(.systemGray3))
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
                    .onTapGesture {self.showImagePicker.toggle()}
            }
        }
        // 选择本地相册
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectImage, sourceType: sourceType)
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
