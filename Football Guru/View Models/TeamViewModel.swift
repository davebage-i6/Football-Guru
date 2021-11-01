//
//  TeamViewModel.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import Foundation
import SwiftUI

class TeamViewModel: ObservableObject, Identifiable {
    private let team: Team
    
    init(_ team: Team) {
        self.team = team
    }
    
    var id: String {
        return team.id
    }
    
    var name: (_ : String, icon: Image) {
        return (team.teamName, Image.Teams.team)
    }
    
    var stadium: (_ : String, icon: Image) {
        return (team.teamStadium, Image.Teams.stadium)
    }
    
    var isNation: Bool {
        return team.isNation.toBool()
    }
    
    var flagImage: Image {
        return FlagNameConverter().flagImage(nationality: nationality, searchType: .team)
    }
    
    var nationality: String {
        return team.teamNationality
    }
    
    var city: (_ : String, icon: Image) {
        return (team.teamCity, Image.Teams.city)
    }
}
