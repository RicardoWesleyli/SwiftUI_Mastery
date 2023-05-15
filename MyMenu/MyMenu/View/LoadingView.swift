//
//  LoadingView.swift
//  MyMenu
//
//  Created by Ricardo Li on 2022/7/22.
//

import SwiftUI

struct LoadingView: View {
    @State var show: Bool = false

    var body: some View {
        Image(systemName: "sun.min.fill")
            .resizable()
            .foregroundColor(Color.Hex(0xFAD0C4))
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
            .rotationEffect(.degrees(show ? 360 : 0))
            .onAppear(perform: {
                doAnimation()
            })
    }

    func doAnimation() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            show.toggle()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

