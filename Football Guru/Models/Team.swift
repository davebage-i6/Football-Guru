//
//  Team.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import Foundation

struct TeamResponse: Codable {
    var result: Teams
}

struct Teams: Codable {
    var teams: [Team]
}

struct Team: Codable, Identifiable {
    let id: String
    let teamName: String
    let teamStadium: String
    let isNation: String
    let teamNationality: String
    let teamCity: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "teamID"
        case teamName
        case teamStadium
        case isNation
        case teamNationality
        case teamCity
    }
}
