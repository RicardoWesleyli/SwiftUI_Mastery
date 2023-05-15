//
//  DragAndDropApp.swift
//  DragAndDrop
//
//  Created by Ricardo Li on 2022/8/27.
//

import SwiftUI

@main
struct DragAndDropApp: App {
    
    @StateObject  var  pageViewModel:  PageViewModel = PageViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pageViewModel)
        }
    }
}
