//
//  TeamView.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

struct TeamView: View {
    @ObservedObject var team: TeamViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            DetailView(text: team.name.0, image: team.name.icon, flag: team.flagImage, isMain: true)
            DetailView(text: team.city.0, image: team.city.icon, flag: nil, isMain: false)
            DetailView(text: team.stadium.0, image: team.stadium.icon, flag: nil, isMain: false)
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct TeamView_Previews: PreviewProvider {
    
    static var previews: some View {
        TeamView(team: TeamViewModel(Team(
            id: "Test ID",
            teamName: "Test Team",
            teamStadium: "Test Stadium",
            isNation: "true",
            teamNationality: "French",
            teamCity: "Toulouse")))
    }
}
