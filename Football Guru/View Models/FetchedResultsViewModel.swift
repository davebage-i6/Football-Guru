//
//  FetchedPlayersViewModel.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI
import Combine

class FetchedResultsViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var fetchedPlayers = [Player]()
    let webservice = Webservice()
    
    // We use this var to cancel the publisher when we no longer need it
    var searchCancellable: AnyCancellable? = nil
    var playerCancellable: AnyCancellable? = nil
    
    init() {
        searchCancellable = $searchQuery
            .removeDuplicates() // Remove any duplicate types entries
            .debounce(for: 0.4, scheduler: RunLoop.main) // Wait until user has finished typing before publishing
            .sink(receiveValue: { str in
                if str.isEmpty {
                    // reset the data
                    print("Let's reset")
                } else {
                    // Search players
                    if let fetchedPlayers = self.webservice.getPlayers(input: str) {
                        self.fetchedPlayers = fetchedPlayers
                    }
                }
            })
    }
}
