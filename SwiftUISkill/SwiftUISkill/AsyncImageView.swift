//
//  AsyncImageView.swift
//  SwiftUISkill
//
//  Created by Ricardo Li on 2022/7/15.
//

import SwiftUI

struct AsyncImageView: View {
    let imageURL = "https://p6-passport.byteacctimg.com/img/user-avatar/d5a142046c78e7760f441c480722b190~300x300.image"

    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imageURL))
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 120, maxWidth: 120, minHeight: 120, maxHeight: 120)
                .cornerRadius(30)
            
            Spacer()
        }.padding()
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
