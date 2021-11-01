//
//  ContentView.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fetchedResultsVM = FetchedResultsViewModel()
    
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        TabView {
            FetchedResultsView()
            // We set the env object so that we can access the data in nested views
                .environmentObject(fetchedResultsVM)
                .tabItem {
                    Image.SearchBar.searchIcon
                }.onAppear {
                    fetchedResultsVM.rechCheckFavourites()
                }
            FavouritesView()
                .tabItem {
                    Image.Favourites.icon
                }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .systemBackground
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
