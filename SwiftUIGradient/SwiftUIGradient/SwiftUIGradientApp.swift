//
//  SwiftUIGradientApp.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import SwiftUI

@main
struct SwiftUIGradientApp: App {
    
    @StateObject  var viewModel: ViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
