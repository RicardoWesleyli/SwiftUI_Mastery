//
//  HapticsView.swift
//  SwiftUISkill
//
//  Created by Ricardo Li on 2022/7/15.
//

import SwiftUI

struct Haptics {
    static func hapticSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    static func hapticWarning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
}

struct HapticsView: View {
    var body: some View {
        VStack(spacing:40) {
            Text("成功时的反馈")
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(5)
                .onTapGesture {
                    Haptics.hapticSuccess()
                }

            Text("失败时的反馈")
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(5)
                .onTapGesture {
                    Haptics.hapticWarning()
                }
        }
    }
}

struct HapticsView_Previews: PreviewProvider {
    static var previews: some View {
        HapticsView()
    }
}
