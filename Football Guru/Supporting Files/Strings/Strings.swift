//
//  Srrings.swift
//  Football Guru
//
//  Created by Dave Bage on 31/10/2021.
//

import Foundation

typealias IterableFootballGuruString = FootballGuruString & CaseIterable

public enum Strings {
    public enum MainSearch: String, IterableFootballGuruString {
        case navTitle = "mainsearch.navtitle"
    }
    
    public enum FavouritesView: String, IterableFootballGuruString {
        case title = "favouritesview.title"
        case none = "favouritesview.none"
    }
    
    public enum SearchState: String, IterableFootballGuruString {
        case newSearch = "searchstate.newsearch"
        case midSearch = "searchstate.midsearch"
    }
}
