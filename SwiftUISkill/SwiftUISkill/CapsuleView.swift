//
//  CapsuleView.swift
//  SwiftUISkill
//
//  Created by Ricardo Li on 2022/7/15.
//

import SwiftUI

struct CapsuleView: View {
    var body: some View {
        Text("文如秋雨")
            .font(.title)
            .foregroundColor(.blue)
            .padding()
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [10]))
            )
    }
}

struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView()
    }
}
