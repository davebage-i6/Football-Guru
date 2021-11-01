//
//  FetchedTeamsView.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import SwiftUI

struct FetchedTeamsView: View {
    @EnvironmentObject var fetchedResultsVM: FetchedResultsViewModel
    
    var body: some View {
        Section(header: Text("Teams"))  {
            ForEach(fetchedResultsVM.fetchedTeams, content: { team in
                TeamView(team: team)
            })
            
            if fetchedResultsVM.teamsExpandable {
                MoreResultsButton(action: fetchedResultsVM.getMoreTeams, buttonTitle: "More teams")
            }
        }
    }
}

struct FetchedTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        FetchedTeamsView()
    }
}
