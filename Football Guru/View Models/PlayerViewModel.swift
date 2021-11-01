//
//  PlayerViewModel.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class PlayerViewModel: ObservableObject, Identifiable {
    struct Constants {
        static let notApplicable = Strings.General.na.localized
    }
    
    let context = PersistenceController.shared.container.viewContext
    
    private let player: Player
    private var subscribers: Set<AnyCancellable> = []
    private let flagConverter = FlagNameConverter()
    
    @Published var isFavourite = false

    init(_ player: Player) {
        self.player = player
        self.isFavourite = checkIfFavourite()
    }
    
    var id: String {
        return player.id
    }
    
    var firstName: String {
        return player.playerFirstName
    }
    
    var secondName: String {
        return player.playerSecondName
    }
    
    var fullName: (_ : String, icon: Image) {
        return ("\(player.playerFirstName) \(player.playerSecondName)", Image.Players.nameIcon)
    }
    
    var nationality: String {
        return player.playerNationality
    }
    
    var flagImage: Image {
        return flagConverter.flagImage(nationality: nationality, searchType: .player)
    }
    
    var age: String {
        return player.playerAge
    }
    
    var club: String {
        return player.playerClub
    }
    
    func checkIfFavourite() -> Bool {
        let predicate = NSPredicate(format: "id == \(player.id)")
        
        if let matchingPlayers = PersistenceController.shared.context.fetch(PlayerCD.self, predicate: predicate, sorting: nil),
           matchingPlayers.isEmpty {
            return false
        }
        return true
    }
    
    func mapToCoreData() {
        let storedPlayer = PlayerCD(context: context)
        
        storedPlayer.id = self.id
        storedPlayer.firstName = self.firstName
        storedPlayer.secondName = self.secondName
        storedPlayer.nationality = self.nationality
        storedPlayer.age = self.age
        storedPlayer.club = self.club
        
        PersistenceController.shared.save()
        self.isFavourite = true
    }
    
    static func mapFromCoreData(player: PlayerCD) -> PlayerViewModel {
        return PlayerViewModel(Player(
            id: player.id ?? Constants.notApplicable,
            playerFirstName: player.firstName ?? Constants.notApplicable,
            playerSecondName: player.secondName ?? Constants.notApplicable,
            playerNationality: player.nationality ?? Constants.notApplicable,
            playerAge: player.age ?? Constants.notApplicable,
            playerClub: player.club ?? Constants.notApplicable))
    }
    
    func removeAsFavourite() {
        let predicate = NSPredicate(format: "id == \(player.id)")
        
        guard let matchingPlayers = PersistenceController.shared.context.fetch(PlayerCD.self, predicate: predicate, sorting: nil) else { return }
        
        if matchingPlayers.isEmpty || matchingPlayers.count > 1 {
            return
        } else {
            context.delete(matchingPlayers[0])
        }
        PersistenceController.shared.save()
        self.isFavourite = false
    }
}
