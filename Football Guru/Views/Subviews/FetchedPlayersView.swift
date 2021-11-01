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
        Section(header: Text(Strings.FetchedPlayers.header.localized)) {
            ForEach(fetchedResultsVM.fetchedPlayers, content: { player in
                PlayerView(player: player)
            })
            
            if fetchedResultsVM.playersExpandable {
                HStack {
                    MoreResultsButton(action: fetchedResultsVM.getMorePlayers, buttonTitle: Strings.FetchedPlayers.more.localized)
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
