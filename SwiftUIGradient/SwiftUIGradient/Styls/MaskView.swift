//
//  MaskView.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/7/2.
//

import SwiftUI

struct MaskView: View {
    var bgColor: Color
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}
