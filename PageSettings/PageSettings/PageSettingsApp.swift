//
//  PageSettingsApp.swift
//  PageSettings
//
//  Created by Ricardo Li on 2022/9/5.
//

import SwiftUI

@main
struct PageSettingsApp: App {
    @StateObject var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            if viewModel.Apps_firstLaunch {
                GuidePageView().environmentObject(viewModel)
            } else {
                if viewModel.isLogin {
                    ContentView().environmentObject(viewModel)
                } else {
                    LoginView().environmentObject(viewModel)
                }
            }
        }
    }
}
