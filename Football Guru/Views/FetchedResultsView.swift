//
//  FetchedPlayersView.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

struct FetchedPlayersView: View {
    
    @StateObject var fetchedPlayersViewModel = FetchedPlayersViewModel()
    
    var body: some View {
        List {
            ForEach(fetchedPlayersViewModel.fetchedPlayers, content: { player in
                VStack {
                    Text("\(player.playerFirstName) \(player.playerSecondName)")
                    HStack {
                        Text(player.playerAge)
                        Text(player.playerClub)
                    }
                }
            })
        }
    }
}

struct FetchedPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        FetchedPlayersView()
    }
}
