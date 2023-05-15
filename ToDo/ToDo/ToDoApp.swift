//
//  ToDoApp.swift
//  ToDo
//
//

import SwiftUI
import CoreData

@main
struct ToDoApp: App {
    
    let persistenceController = Persistence.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
