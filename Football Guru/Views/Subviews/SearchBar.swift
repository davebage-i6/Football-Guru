//
//  SearchBar.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI

struct SearchBar: View {
    // MARK: - Constants
    
    struct Constants {
        struct Shadow {
            static let opacity: CGFloat = 0.1
            static let radius: CGFloat = 2
        }
        
        struct General {
            static let padding: CGFloat = 10
            static let cornerRadius: CGFloat = 5
        }
    }
    
    // MARK: - Properties
    
    @EnvironmentObject var fetchedResultsVM: FetchedResultsViewModel
    
    // MARK: - View
    
    var body: some View {
        HStack {
            HStack {
                Image.SearchBar.searchIcon
                    .foregroundColor(.gray)
                TextField(Strings.MainSearch.searchBarPlaceholder.localized, text: $fetchedResultsVM.searchQuery) // Bind to view model search property
                    .cornerRadius(Constants.General.cornerRadius)
                    .foregroundColor(Color.searchBarText)
            }
            .padding(.vertical, Constants.General.padding)
            .padding(.horizontal)
            .background(Color.searchBarBackground)
            .shadow(color: Color.black.opacity(Constants.Shadow.opacity), radius: Constants.Shadow.radius, x: Constants.Shadow.radius, y: Constants.Shadow.radius)
            .shadow(color: Color.black.opacity(Constants.Shadow.opacity), radius: Constants.Shadow.radius, x: -Constants.Shadow.radius, y: -Constants.Shadow.radius)
            
        }.padding().padding(.top, Constants.General.padding)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
