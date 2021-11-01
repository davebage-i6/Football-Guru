//
//  FavouritesButton.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import SwiftUI

struct FavouritesButton: View {
    @ObservedObject var player: PlayerViewModel
    @EnvironmentObject var favouritesVM: FavouritePlayersViewModel
    
    var body: some View {
        Button(action: {
            favouritesVM.addOrRemoveFavourite(player: player)
        }) {
            if player.isFavourite {
                Image.Favourites.favouriteSelected
                    .foregroundColor(Color.yellow)
            } else {
                Image.Favourites.icon
                    .foregroundColor(Color.gray)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct FavouritesButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesButton(player: PlayerViewModel(Player(
            id: "Test ID",
            playerFirstName: "TestFirstName",
            playerSecondName: "TestSecondName",
            playerNationality: "French",
            playerAge: "32",
            playerClub: "Newcastle United")))
    }
}
