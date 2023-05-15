//
//  ContentView.swift
//  RGBToHex
//
//  Created by Ricardo Li on 2022/8/3.
//

import SwiftUI

struct ContentView: View {
    @State var colorName: String = "请输入RGB值"
    @State var redColor: String = ""
    @State var greenColor: String = ""
    @State var blueColor: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            colorCard()
            rgbInput()
            Spacer()
        }
        .padding()
        .onTapGesture {
            self.hideKeyboard()
        }
    }

    // 色卡展示
    func colorCard() -> some View {
        Text(colorName)
            .font(.system(size: 23))
            .fontWeight(.bold)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 240)
            .padding()
            .foregroundColor(.white)
            .background(toRGB(red: redColor, green: greenColor, blue: blueColor))
            .cornerRadius(8)
    }

    // RGB 输入值
    func rgbInput() -> some View {
        HStack {
            TextField("red", text: $redColor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .keyboardType(.numberPad)
                .onChange(of: redColor) { _ in
                    colorName = toRGB(red: redColor, green: greenColor, blue: blueColor).hexToRGB ?? "颜色解析错误"
                }
            TextField("green", text: $greenColor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .keyboardType(.numberPad)
                .onChange(of: greenColor) { _ in
                    colorName = toRGB(red: redColor, green: greenColor, blue: blueColor).hexToRGB ?? "颜色解析错误"
                }
            TextField("blue", text: $blueColor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .keyboardType(.numberPad)
                .onChange(of: blueColor) { _ in
                    colorName = toRGB(red: redColor, green: greenColor, blue: blueColor).hexToRGB ?? "颜色解析错误"
                }
        }
    }

    // 颜色转换方法
    func toRGB(red: String, green: String, blue: String) -> Color {
        let r = Double(red) ?? 51
        let g = Double(green) ?? 51
        let b = Double(blue) ?? 51
        let selectColor = Color(red: r / 255, green: g / 255, blue: b / 255)
        return selectColor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    var uiColor: UIColor { .init(self) }
    typealias RGBA = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    var rgba: RGBA? {
        var (r, g, b, a): RGBA = (0, 0, 0, 0)
        return uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) ? (r, g, b, a) : nil
    }

    var hexToRGB: String? {
        guard let rgba = rgba else { return nil }
        return String(format: "#%02X%02X%02X",
                      Int(rgba.red * 255),
                      Int(rgba.green * 255),
                      Int(rgba.blue * 255))
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
