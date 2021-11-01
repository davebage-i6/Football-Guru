//
//  DetailView.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import SwiftUI

struct DetailView: View {
    struct Constants {
        static let flagWidth: CGFloat = 25
        static let padding: CGFloat = 5
    }
    
    let text: String
    let image: Image
    let flag: Image?
    let isMain: Bool
    
    var body: some View {
        HStack {
            image
            Text(text)
                .font(isMain ? .headline : .none)
                .foregroundColor(isMain ? Color.headerBackground : .none)
            if let flag = flag {
                flag
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.flagWidth, height: nil)
            }
        }
        .padding(.bottom, Constants.padding)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(text: "Test", image: Image.Players.nameIcon, flag: Image("China"), isMain: false)
    }
}
