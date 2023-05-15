//
//  LoadingView.swift
//  ColourAtla
//
//  Created by Ricardo Li on 2022/7/8.
//

import SwiftUI

struct LoadingView: View {
    @State var show: Bool = false

    var body: some View {
        VStack(spacing:10){
            Image(systemName: "sun.min.fill")
                .resizable()
                .foregroundColor(Color.Hex(0xFAD0C4))
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(show ? 360 : 0))
                .onAppear(perform: {
                    doAnimation()
                })
            Text("Loading...")
                .font(.system(size: 14))
        }
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
