//
//  FavouriteButtonViewModel.swift
//  Football Guru
//
//  Created by Dave Bage on 30/10/2021.
//

import Foundation

class FavouriteButtonViewModel: ObservableObject {
    func checkIfFavourite(player: PlayerViewModel) {
        player.isFavourite = player.checkIfFavourite()
    }
}
