//
//  ViewModel.swift
//  PageSettings
//
//  Created by Ricardo Li on 2022/9/5.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var isLogin: Bool = false
    @AppStorage("App_firstLaunch") var Apps_firstLaunch: Bool = true
}
