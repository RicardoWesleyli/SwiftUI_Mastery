//
//  SwiftUIImage.swift
//  Chapter3
//

import SwiftUI

struct SwiftUIImage: View {
    let imageURL = "https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/422fc1ab9955464ab56e80f65b0325fb~tplv-k3u1fbpfcp-zoom-crop-mark:3024:3024:3024:1702.image?"

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 280)
                .cornerRadius(16)
        } placeholder: {
            Text("图片加载中")
                .font(.system(size: 24))
                .foregroundColor(.gray)
                .padding()
                .frame(width: 280,height: 160)
                .background(Color(.systemGray6))
                .cornerRadius(16)
        }
    }
}

struct SwiftUIImage_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImage()
    }
}
