//
//  SwiftUIWidgetApp.swift
//  SwiftUIWidget
//
//

import SwiftUI

@main
struct SwiftUIWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    UIApplication.shared.open(url)
                })
        }
    }
}
