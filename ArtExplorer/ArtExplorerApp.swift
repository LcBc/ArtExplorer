//
//  ArtExplorerApp.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 13/7/21.
//

import SwiftUI

@main
struct ArtExplorerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
