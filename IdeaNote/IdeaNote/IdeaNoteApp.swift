//
//  IdeaNoteApp.swift
//  IdeaNote
//
//  Created by Ricardo Li on 2022/9/17.
//

import SwiftUI

@main
struct IdeaNoteApp: App {
    
    @StateObject  var viewModel: ViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
