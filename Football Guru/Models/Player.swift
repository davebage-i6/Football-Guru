//
//  PlayerModel.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import Foundation

struct PlayerModel: Codable {
    let playerID: String
    let playerFirstName: String
    let playerSecondName: String
    let playerNationality: String
    let playerAge: String
    let playerClub: String
}
