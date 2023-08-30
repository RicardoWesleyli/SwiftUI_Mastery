//
//  GradientBtnView.swift
//  Chapter6
//

import SwiftUI

struct GradientBtnView: View {
    var body: some View {
        Button(action: {
            // 点击后的操作
        }) {
            Text("立即使用")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding()
                .frame(width: 180)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(16)
        }
    }
}

struct GradientBtnView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBtnView()
    }
}
