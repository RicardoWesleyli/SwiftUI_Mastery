//
//  ViewModel.swift
//  Chapter21
//

import LocalAuthentication
import SwiftUI

class ViewModel: ObservableObject {
    // FaceID状态
    @Published var isLock: Bool = false
    
    // 开启FaceID
    @AppStorage("isOpenFaceID") var isOpenFaceID = false

    // FaceID识别方法
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "开启面容 ID 权限才能够使用解锁哦"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.isLock = true
                    } else {
                        self.isLock = false
                    }
                }
            }
        } else {
            if error?.code == -6 {
                print("没有生物指纹识别功能")
            }
        }
    }
}
