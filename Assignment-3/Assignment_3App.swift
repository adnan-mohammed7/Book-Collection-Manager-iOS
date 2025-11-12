//
//  Assignment_3App.swift
//  Assignment-3
//
//  Created by user278021 on 11/11/25.
//

import SwiftUI
import CoreData

@main
struct Assignment_3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
