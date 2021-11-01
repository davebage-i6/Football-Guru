//
//  TestPlayerResponse.swift
//  Football GuruTests
//
//  Created by Dave Bage on 31/10/2021.
//

import XCTest
import Foundation
@testable import Football_Guru

class TestTeamsResponse {
    static func teamData(team: Team) -> TeamResponse? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(TeamResponse.self, from: testTeamJSON(team: team))
            
        } catch {
            XCTFail("Unable to decode data")
            return nil
        }
    }
    
    static func testTeamJSON(team: Team) -> Data {
        return """
            {
                "result": {
                    "teams": [{
                        "teamID": "\(team.id)",
                        "teamName": "\(team.teamName)",
                        "teamStadium": "\(team.teamStadium)",
                        "isNation": "\(team.isNation)",
                        "teamNationality": "\(team.teamNationality)",
                        "teamCity": "\(team.teamCity)"
                    },{
                        "teamID": "3456",
                        "teamName": "My team",
                        "teamStadium": "Awesome Stadium",
                        "isNation": "false",
                        "teamNationality": "French",
                        "teamCity": "Toulouse"
                    }],
                    "status": true,
                    "message": "0 Searched for Max",
                    "request_order": 0,
                    "searchType": "players",
                    "searchString": "Max",
                    "minVer": "0.7.3",
                    "serverAlert": ""
                }
            }
            """
            .data(using: .utf8)!
    }
}
