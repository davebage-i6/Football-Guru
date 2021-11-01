//
//  Football_GuruApp.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

@main
struct Football_GuruApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var favouritePlayers = FavouritePlayersViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(favouritePlayers)
        }
    }
}
 
