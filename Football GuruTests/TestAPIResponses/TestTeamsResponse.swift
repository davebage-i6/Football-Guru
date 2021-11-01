//
//  TestPlayerResponse.swift
//  Football GuruTests
//
//  Created by Dave Bage on 31/10/2021.
//

import XCTest
import Foundation
@testable import Football_Guru

class TestPlayerResponse {
    
    static func playerData(player: Player) -> PlayerResponse? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(PlayerResponse.self, from: testPlayerJSON(player: player))
            
        } catch {
            XCTFail("Unable to decode data")
            return nil
        }
    }
    
    static func testPlayerJSON(player: Player) -> Data {
        return """
            {
                "result": {
                    "players": [{
                        "playerID": "\(player.id)",
                        "playerFirstName": "\(player.playerFirstName)",
                        "playerSecondName": "\(player.playerSecondName)",
                        "playerNationality": "\(player.playerNationality)",
                        "playerAge": "\(player.playerAge)",
                        "playerClub": "\(player.playerClub)"
                    },{
                        "playerID": "216819",
                        "playerFirstName": "Maxime",
                        "playerSecondName": "Lopez",
                        "playerNationality": "French",
                        "playerAge": "23",
                        "playerClub": "Marseille"
                    }, {
                        "playerID": "112386",
                        "playerFirstName": "Maxime",
                        "playerSecondName": "Colin",
                        "playerNationality": "French",
                        "playerAge": "29",
                        "playerClub": "Birmingham City"
                    }, {
                        "playerID": "23275",
                        "playerFirstName": "Max",
                        "playerSecondName": "Kruse",
                        "playerNationality": "German",
                        "playerAge": "33",
                        "playerClub": "Werder Bremen"
                    }, {
                        "playerID": "14389",
                        "playerFirstName": "Maxi",
                        "playerSecondName": "Pereira",
                        "playerNationality": "Uruguayan",
                        "playerAge": "37",
                        "playerClub": "FC Porto"
                    }, {
                        "playerID": "177622",
                        "playerFirstName": "Maxwell",
                        "playerSecondName": "Cornet",
                        "playerNationality": "Ivorian",
                        "playerAge": "25",
                        "playerClub": "Lyon"
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
