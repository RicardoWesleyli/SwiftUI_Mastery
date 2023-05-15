//
//  GuidePageView.swift
//  PageSettings
//
//  Created by Ricardo Li on 2022/9/5.
//

import SwiftUI

struct GuidePageView: View {
    let imageModels = ["image001", "image002", "image003", "image004"]
    let textModels = ["勤测体温", "勤加消毒", "勤洗双手", "出门戴口罩"]
    
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        TabView {
            ForEach(imageModels.indices, id: \.self) { index in
                VStack(spacing: 80) {
                    Image(imageModels[index])
                        .resizable()
                        .scaledToFit()

                    Text(textModels[index])
                        .font(.title)
                        .bold()

                    if imageModels[index] == imageModels.last {
                        Button(action: {
                            viewModel.Apps_firstLaunch = false
                        }) {
                            Text("立即体验")
                                .font(.system(size: 17))
                                .bold()
                                .frame(minWidth: 0, maxWidth: 120)
                                .padding()
                                .foregroundColor(.white)
                                .background(.green)
                                .cornerRadius(8)
                        }
                    } else {
                        Image(systemName: "arrow.forward.circle")
                            .font(.largeTitle)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .edgesIgnoringSafeArea(.all)
    }
}

struct GuidePageView_Previews: PreviewProvider {
    static var previews: some View {
        GuidePageView()
    }
}
