//
//  FlicksApp.swift
//  Flicks
//
//  Created by Noel Obaseki on 21/04/2022.
//

import SwiftUI

@main
struct FlicksApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MovieListView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
