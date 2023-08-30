//
//   SwiftUIAnimations4.swift
//  Chapter25
//

import SwiftUI

struct _SwiftUIAnimations4: View {
    @State var isStart: Bool = false
    @State var isPause: Bool = false

    var body: some View {
        VStack {
            // 是否开始
            if isStart {
                // 是否暂停
                if isPause {
                    HStack {
                        Btn(btnName: "结束", btnColor: Color.red)
                            .onTapGesture {
                                self.isStart = false
                                self.isPause = false
                            }
                        Btn(btnName: "继续", btnColor: Color.green)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5)) {
                                    self.isPause = false
                                }
                            }
                    }
                } else {
                    Btn(btnName: "暂停", btnColor: Color.blue)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5)) {
                                self.isPause = true
                            }
                        }
                }
            } else {
                Btn(btnName: "开始", btnColor: Color.green)
                    .onTapGesture {
                        self.isStart = true
                    }
            }
        }
    }
}

// 按钮
struct Btn: View {
    var btnName: String
    var btnColor: Color

    var body: some View {
        Text(btnName)
            .foregroundColor(.white)
            .padding()
            .bold()
            .frame(maxWidth: .infinity)
            .background(btnColor)
            .cornerRadius(32)
            .padding(.horizontal)
    }
}


struct _SwiftUIAnimations4_Previews: PreviewProvider {
    static var previews: some View {
        _SwiftUIAnimations4()
    }
}
