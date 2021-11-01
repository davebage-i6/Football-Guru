//
//  Strings.swift
//  Football Guru
//
//  Created by Dave Bage on 31/10/2021.
//

import Foundation

typealias IterableFootballGuruString = FootballGuruString & CaseIterable

public enum Strings {
    public enum General: String, IterableFootballGuruString {
        case na = "general.na"
    }
    
    public enum MainSearch: String, IterableFootballGuruString {
        case navTitle = "mainsearch.navtitle"
        case searchBarPlaceholder = "mainsearch.searchbarplaceholder"
    }
    
    public enum FavouritesView: String, IterableFootballGuruString {
        case title = "favouritesview.title"
        case none = "favouritesview.none"
    }
    
    public enum SearchState: String, IterableFootballGuruString {
        case newSearch = "searchstate.newsearch"
        case midSearch = "searchstate.midsearch"
    }
    
    public enum FetchedPlayers: String, IterableFootballGuruString {
        case header = "fetchedplayers.header"
        case more = "fetchedplayers.more"
    }
    
    public enum FetchedTeams: String, IterableFootballGuruString {
        case header = "fetchedteams.header"
        case more = "fetchedteams.more"
    }
    
    public enum Player: String, IterableFootballGuruString {
        case age = "player.age"
        case club = "player.club"
    }
}
