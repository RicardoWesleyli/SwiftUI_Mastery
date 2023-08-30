//
//  ColorCardView.swift
//  Chapter11
//

import SwiftUI

struct ColorCardView: View {
    @State private var redValue: CGFloat = 243
    @State private var greenValue: CGFloat = 248
    @State private var blueValue: CGFloat = 232

    var body: some View {
        Form {
            // 色块展示区域
            Section {
                Rectangle()
                    .fill(Color(
                        red: redValue / 255,
                        green: greenValue / 255,
                        blue: blueValue / 255)
                    )
                    .frame(height: 200)
                    .cornerRadius(8)
            }

            // 颜色控制区域
            Section {
                // 红色滑块
                HStack {
                    Text("R: \(String(Int(redValue)))")
                    Slider(
                        value: $redValue,
                        in: 0 ... 255,
                        step: 1
                    ).accentColor(.red)
                }
                // 绿色滑块
                HStack {
                    Text("G: \(String(Int(greenValue)))")
                    Slider(
                        value: $greenValue,
                        in: 0 ... 255,
                        step: 1
                    ).accentColor(.green)
                }
                // 蓝色滑块
                HStack {
                    Text("B: \(String(Int(blueValue)))")
                    Slider(
                        value: $blueValue,
                        in: 0 ... 255,
                        step: 1
                    ).accentColor(.blue)
                }
            }
        }
    }
}

struct ColorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCardView()
    }
}
