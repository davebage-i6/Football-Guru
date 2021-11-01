//
//  FavouritesView.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

typealias FavStrings = Strings.FavouritesView

struct FavouritesView: View {
    @EnvironmentObject var favouritePlayersVM: FavouritePlayersViewModel
    var context = PersistenceController.shared.container.viewContext
    
    var body: some View {
        NavigationView {
            VStack {
                if favouritePlayersVM.players.isEmpty {
                    Placeholder(text: FavStrings.none.localized, image: Image.Favourites.lonely)
                } else {
                    List {
                        ForEach(favouritePlayersVM.players) { player in
                            PlayerView(player: player)
                        }
                    }
                    .listStyle(.plain)
                    .padding()
                }
            }
            .navigationTitle(FavStrings.title.localized)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
