//
//  StringsTests.swift
//  Football GuruTests
//
//  Created by Dave Bage on 31/10/2021.
//

import XCTest
@testable import Football_Guru

class StringsTests: XCTestCase {
    func testThatLocalizedStringIsPresent() {
        Strings.General.allCases.forEach {
            XCTAssertFalse(checkLocalizedString(key: $0), "\($0) is missing from the strings file.")
        }
        
        Strings.MainSearch.allCases.forEach {
            XCTAssertFalse(checkLocalizedString(key: $0), "\($0) is missing from the strings file.")
        }
        
        Strings.FavouritesView.allCases.forEach {
            XCTAssertFalse(checkLocalizedString(key: $0), "\($0) is missing from the strings file.")
        }
        
        Strings.SearchState.allCases.forEach {
            XCTAssertFalse(checkLocalizedString(key: $0), "\($0) is missing from the strings file.")
        }
        
        Strings.FetchedPlayers.allCases.forEach {
            XCTAssertFalse(checkLocalizedString(key: $0), "\($0) is missing from the strings file.")
        }
        
        Strings.FetchedTeams.allCases.forEach {
            XCTAssertFalse(checkLocalizedString(key: $0), "\($0) is missing from the strings file.")
        }
        
        Strings.Player.allCases.forEach {
            XCTAssertFalse(checkLocalizedString(key: $0), "\($0) is missing from the strings file.")
        }
    }
    
    func checkLocalizedString(key: FootballGuruString) -> Bool {
        print("\(key) = \(key.localized)")
        return (key.localized == "**\(key)**") // key will be returned wrapped in ** if not present in file
    }
}
