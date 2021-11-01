//
//  SearchType.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import Foundation

enum SearchType {
    case players
    case teams
    
    func params(str: String, offset: Int?) -> SearchQuery {
        switch self {
        case .players:
            return SearchQuery(searchString: str, searchType: "players", offset: offset)
            
        case .teams:
            return SearchQuery(searchString: str, searchType: "teams", offset: offset)
        }
    }
}
