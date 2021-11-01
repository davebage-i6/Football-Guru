//
//  MoreResultsButton.swift
//  Football Guru
//
//  Created by Dave Bage on 31/10/2021.
//

import SwiftUI

struct MoreResultsButton: View {
    let action: () -> Void
    let buttonTitle: String
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image.MoreButton.more
                    .foregroundColor(Color.blue)
                Text("\(buttonTitle)...")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct MoreResultsButton_Previews: PreviewProvider {
    static var previews: some View {
        MoreResultsButton(action: {
            print("test")
        }, buttonTitle: "More results")
    }
}
