//
//  SwiftUIForm5.swift
//  Chapter11
//

import SwiftUI

struct SwiftUIForm5: View {
    @State var isPlay = false

    var body: some View {
        Form {
            Section(
                header: Text("声音场景"),
                footer: Text("开启时自动播放声音")
            ) {
                Toggle(isOn: $isPlay) {
                    Text("自动播放")
                }
                .onChange(of: isPlay, perform: { _ in
                    if isPlay {
                        // 开启自动播放
                    } else {
                        // 关闭自动播放
                    }
                })
            }
        }
    }
}

struct SwiftUIForm5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIForm5()
    }
}
