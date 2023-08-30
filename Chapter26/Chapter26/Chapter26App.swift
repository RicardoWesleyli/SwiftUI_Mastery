//
//  Chapter26App.swift
//  Chapter26
//
//  Created by Ricardo Li on 2023/8/30.
//

import SwiftUI

@main
struct Chapter26App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
