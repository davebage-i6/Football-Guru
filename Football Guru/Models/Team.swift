//
//  TeamModel.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import Foundation

struct TeamModel: Codable {
    let teamID: String
    let teamName: String
    let teamStadium: String
    let isNation: Bool
    let teamNationality: String
    let teamCity: String
}
