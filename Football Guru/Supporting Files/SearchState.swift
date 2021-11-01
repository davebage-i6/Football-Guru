//
//  SearchState.swift
//  Football Guru
//
//  Created by Dave Bage on 31/10/2021.
//
import SwiftUI

enum SearchState {
    case newSearch
    case searchFinishedWithNoResults
    case midSearch
    case searchFinishedWithResults
    
    func getPlaceholder() -> (text: String, image: Image?)? {
        switch self {
            case .searchFinishedWithNoResults:
                return ("", Image.SearchState.finishedNoResults)
            case .newSearch:
                return (Strings.SearchState.newSearch.localized, Image.SearchState.newSearch)
            case .midSearch:
                return (Strings.SearchState.midSearch.localized, nil)
            case .searchFinishedWithResults:
                return nil
        }
    }
}
