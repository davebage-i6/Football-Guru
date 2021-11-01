//
//  FavouritePlayersViewModel.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import Foundation
import SwiftUI
import CoreData

class FavouritePlayersViewModel: ObservableObject {
    @Published var players = [PlayerViewModel]()
    
    init() {
        updateFavourites()
    }
    
    func updateFavourites() {
        let context = PersistenceController.shared.container.viewContext
        let savedPlayers = context.fetchAll(PlayerCD.self)
        players = [PlayerViewModel]()
        
        savedPlayers.forEach {
            players.append(PlayerViewModel.mapFromCoreData(player: $0))
        }
    }
    
    func addOrRemoveFavourite(player: PlayerViewModel) {
        if player.isFavourite {
            removeFavourite(player: player)
        } else {
            addFavourite(player: player)
        }
    }

    func addFavourite(player: PlayerViewModel) {
        player.mapToCoreData()
        updateFavourites()
    }
    
    func removeFavourite(player: PlayerViewModel) {
        player.removeAsFavourite()
        updateFavourites()
    }
}
