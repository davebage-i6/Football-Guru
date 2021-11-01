//
//  PlayerModelTests.swift
//  Football GuruTests
//
//  Created by Dave Bage on 31/10/2021.
//

import Foundation

import XCTest
@testable import Football_Guru

// Test that Player model decodes API response successfully

class PlayerModelTests: XCTestCase {
    func testPlayerModel() {
        let testPlayer = Player(
            id: "123",
            playerFirstName: "David",
            playerSecondName: "Bage",
            playerNationality: "British",
            playerAge: "37",
            playerClub: "Newcastle United")
        
        let apiResponse = TestPlayerResponse.playerData(player: testPlayer)
        
        XCTAssertEqual(apiResponse?.result.players[0].id, testPlayer.id)
        XCTAssertEqual(apiResponse?.result.players[0].playerFirstName, testPlayer.playerFirstName)
        XCTAssertEqual(apiResponse?.result.players[0].playerSecondName, testPlayer.playerSecondName)
        XCTAssertEqual(apiResponse?.result.players[0].playerNationality, testPlayer.playerNationality)
        XCTAssertEqual(apiResponse?.result.players[0].playerAge, testPlayer.playerAge)
        XCTAssertEqual(apiResponse?.result.players[0].playerClub, testPlayer.playerClub)
    }
}
