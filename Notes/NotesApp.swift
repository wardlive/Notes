//
//  NotesApp.swift
//  Notes
//
//  Created by Pavel Neprin on 10/21/22.
//

import SwiftUI

@main
struct NotesApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
} 
