//
//  Placeholder.swift
//  Football Guru
//
//  Created by Dave Bage on 30/10/2021.
//

import SwiftUI

struct Placeholder: View {
    let text: String
    let image: Image?
    var body: some View {
        VStack {
            image
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(Color.headerBackground)
        }
    }
}

struct Placeholder_Previews: PreviewProvider {
    static var previews: some View {
        Placeholder(text: "test", image: Image.Players.nameIcon)
    }
}
