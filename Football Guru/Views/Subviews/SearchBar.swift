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
        struct General {
            static let fontSize: CGFloat = 15
        }
        
        struct MainField {
            static let horizontalPadding: CGFloat = 40
            static let widthAdjustment: CGFloat = 110
            static let height: CGFloat = 45
            static let cornerRadius: CGFloat = 10
            static let topPadding: CGFloat = 30
        }
        
        struct SearchIcon {
            static let backgroundOpacity: CGFloat = 0.1
            static let minWidth: CGFloat = 0
            static let leadingPadding: CGFloat = 16
        }
        
        struct Button {
            static let cornerRadius: CGFloat = 5
            static let padding: CGFloat = 5
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
                TextField("Search players & teams", text: $fetchedResultsVM.searchQuery) // Bind to view model search property
                    .cornerRadius(5)
                    .foregroundColor(Color.searchBarText)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.searchBarBackground)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 2)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: -2, y: -2)

        }.padding().padding(.top, Constants.MainField.topPadding)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
