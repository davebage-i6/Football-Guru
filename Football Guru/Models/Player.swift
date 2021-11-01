//
//  Player.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import Foundation

struct PlayerResponse: Codable {
    var result: Players
}

struct Players: Codable {
    var players: [Player]
}

struct Player: Codable, Identifiable {
    let id: String
    let playerFirstName: String
    let playerSecondName: String
    let playerNationality: String
    let playerAge: String
    let playerClub: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "playerID"
        case playerFirstName
        case playerSecondName
        case playerNationality
        case playerAge
        case playerClub
    }
}
