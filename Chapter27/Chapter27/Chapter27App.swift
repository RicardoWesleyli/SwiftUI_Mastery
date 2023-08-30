//
//  Chapter27App.swift
//  Chapter27
//

import SwiftUI

@main
struct Chapter27App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    UIApplication.shared.open(url)
                })
        }
    }
}
