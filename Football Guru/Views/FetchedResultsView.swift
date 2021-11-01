//
//  FetchedResultsView.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

struct FetchedResultsView: View {
    
    @EnvironmentObject var fetchedResultsVM: FetchedResultsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar()
                    .environmentObject(fetchedResultsVM)
                Spacer()
                if (fetchedResultsVM.fetchedPlayers.isEmpty && fetchedResultsVM.fetchedTeams.isEmpty) || fetchedResultsVM.state == .midSearch {
                    if fetchedResultsVM.state == .midSearch {
                        ProgressView()
                            .padding()
                    }
                    
                    Placeholder(text: fetchedResultsVM.state.getPlaceholder()?.text ?? "", image: fetchedResultsVM.state.getPlaceholder()?.image)
                    Spacer()
                } else {
                    List {
                        if !fetchedResultsVM.fetchedPlayers.isEmpty {
                            FetchedPlayersView()
                                .environmentObject(fetchedResultsVM)
                        }
                        
                        if !fetchedResultsVM.fetchedTeams.isEmpty {
                            FetchedTeamsView()
                                .environmentObject(fetchedResultsVM)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(Strings.MainSearch.navTitle.localized)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Prevents split screen on iPadOS
    }
}

struct FetchedResultsView_Previews: PreviewProvider {
    static var previews: some View {
        FetchedResultsView()
    }
}
