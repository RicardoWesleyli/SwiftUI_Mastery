//
//  BannerView.swift
//  Chapter10
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack{
            TabView {
                ForEach(bannerModels) { item in
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(16)
                        .padding(.horizontal)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 200)
            
            Spacer()
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
