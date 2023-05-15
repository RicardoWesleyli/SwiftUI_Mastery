//
//  LoadingView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/7/1.
//

import SwiftUI

struct LoadingView: View {

    @State var rotateBall = true
    @State var showPopup = true
    
    var body: some View {
        LoadingAnimationView(showPopup: $showPopup, rotateBall: $rotateBall)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

struct LoadingAnimationView: View {
    @Binding var showPopup: Bool
    @Binding var rotateBall: Bool

    @State var animateBall = false
    @State var animateRotation = false

    var body: some View {
        ZStack {

            Circle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 40)
                .rotation3DEffect(
                    Angle(degrees: 60),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1.0
                )
                .offset(y: 35)
                .opacity(animateBall ? 1 : 0)
            Image(systemName: Constants.loadingIcon)
                .resizable()
                .foregroundColor(Color.Hex(0xfad0c4))
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: rotateBall && animateRotation ? 360 : 0))
                .offset(y: animateBall ? 10 : -25)
        }
        .onAppear(perform: {
            doAnimation()
        })
    }

    func doAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)) {
            animateBall.toggle()
        }

        withAnimation(Animation.linear(duration: 0.8).repeatForever(autoreverses: true)) {
            animateRotation.toggle()
        }
    }
}
