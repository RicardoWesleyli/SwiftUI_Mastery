//
//  SwiftUICoreDataApp.swift
//  SwiftUICoreData
//
//  Created by Ricardo Li on 2023/5/7.
//

import SwiftUI

@main
struct SwiftUICoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
