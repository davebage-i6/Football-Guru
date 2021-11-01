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
        Section(header: Text(Strings.FetchedTeams.header.localized))  {
            ForEach(fetchedResultsVM.fetchedTeams, content: { team in
                TeamView(team: team)
            })
            
            if fetchedResultsVM.teamsExpandable {
                MoreResultsButton(action: fetchedResultsVM.getMoreTeams, buttonTitle: Strings.FetchedTeams.more.localized)
            }
        }
    }
}

struct FetchedTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        FetchedTeamsView()
    }
}
