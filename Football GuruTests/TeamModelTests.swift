//
//  TeamModelTests.swift
//  Football GuruTests
//
//  Created by Dave Bage on 31/10/2021.
//

import Foundation
import XCTest
@testable import Football_Guru

// Test that Team model decodes API response successfully

class TeamModelTests: XCTestCase {
    func testTeamModel() {
        let testTeam = Team(
            id: "123",
            teamName: "Newcastle United",
            teamStadium: "St James Park",
            isNation: "false",
            teamNationality: "British",
            teamCity: "Newcastle")
        
        let apiResponse = TestTeamsResponse.teamData(team: testTeam)
        
        XCTAssertEqual(apiResponse?.result.teams[0].id, testTeam.id)
        XCTAssertEqual(apiResponse?.result.teams[0].teamName, testTeam.teamName)
        XCTAssertEqual(apiResponse?.result.teams[0].teamStadium, testTeam.teamStadium)
        XCTAssertEqual(apiResponse?.result.teams[0].isNation, testTeam.isNation)
        XCTAssertEqual(apiResponse?.result.teams[0].teamNationality, testTeam.teamNationality)
        XCTAssertEqual(apiResponse?.result.teams[0].teamCity, testTeam.teamCity)
    }
}
