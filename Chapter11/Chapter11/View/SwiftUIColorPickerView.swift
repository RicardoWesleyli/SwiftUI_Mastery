//
//  SwiftUIColorPickerView.swift
//  Chapter11
//

import SwiftUI

struct SwiftUIColorPickerView: View {
    @State private var colorValue: Color = .blue

    var body: some View {
        Form {
            // 色块展示区域
            Section {
                Rectangle()
                    .fill(colorValue)
                    .frame(height: 200)
                    .cornerRadius(8)
            }

            // 颜色控制区域
            Section {
                ColorPicker(colorValue.colorToString!, selection: $colorValue)
            }
        }
    }
}

struct SwiftUIColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColorPickerView()
    }
}
