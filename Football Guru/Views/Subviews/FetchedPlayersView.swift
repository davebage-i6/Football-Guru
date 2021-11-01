//
//  FetchedPlayersView.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import SwiftUI

struct FetchedPlayersView: View {
    @EnvironmentObject var fetchedResultsVM: FetchedResultsViewModel
    
    var body: some View {
        Section(header: Text("Players")) {
            ForEach(fetchedResultsVM.fetchedPlayers, content: { player in
                PlayerView(player: player)
            })
            
            if fetchedResultsVM.fetchedPlayers.count == 10 {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("More players...")
                }
            }
        }
    }
}

struct FetchedPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        FetchedPlayersView()
    }
}
