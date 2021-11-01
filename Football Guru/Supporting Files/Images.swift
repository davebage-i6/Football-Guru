//
//  Images.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

extension Image {
    struct SearchBar {
        public static let searchIcon = Image(systemName: "magnifyingglass")
    }
    
    struct Favourites {
        public static let icon = Image(systemName: "star")
        public static let favouriteSelected = Image(systemName: "star.fill")
        public static let lonely = Image("lonely")
    }
    
    struct Players {
        public static let nameIcon = Image(systemName: "person.fill")
    }
    
    struct Teams {
        public static let stadium = Image(systemName: "sportscourt.fill")
        public static let team = Image(systemName: "person.3.fill")
        public static let city = Image(systemName: "building.2.fill")
    }
    
    struct MoreButton {
        public static let more = Image(systemName: "plus.circle")
    }
    
    struct SearchState {
        public static let finishedNoResults = Image("noResults")
        public static let newSearch = Image("search")
        
    }
}
