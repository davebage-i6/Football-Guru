//
//  PlayerView.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var player: PlayerViewModel
    @EnvironmentObject var favouritesVM: FavouritePlayersViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                DetailView(text: player.fullName.0, image: player.fullName.icon, flag: player.flagImage, isMain: true)
                
                HStack {
                    HStack {
                        Text(Strings.Player.age.localized).subtitled()
                        Text(player.age)
                    }
                    
                    HStack {
                        Text(Strings.Player.club.localized).subtitled()
                        Text(player.club)
                    }
                    Spacer()
                }
            }
            FavouritesButton(player: player)
                .environmentObject(favouritesVM)
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct PlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerView(player: PlayerViewModel(Player(
            id: "Test ID",
            playerFirstName: "TestFirstName",
            playerSecondName: "TestSecondName",
            playerNationality: "TestNationality",
            playerAge: "32",
            playerClub: "Newcastle United")))
    }
}
