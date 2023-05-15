//
//  LoveTapModifier.swift
//  LoveAnimation
//
//  Created by Ricardo Li on 2022/7/16.
//

import SwiftUI

struct LoveTapModifier: ViewModifier {
    @State var time = 0.0
    let duration = 1.0
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(.red)
                .modifier(LoveGeometryEffect(time: time))
                .opacity(time == 1 ? 0 : 1)
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}
