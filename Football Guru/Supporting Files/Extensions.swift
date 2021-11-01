//
//  Extensions.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import SwiftUI

extension String {
    func toBool() -> Bool {
        return self == "true"
    }
}

extension Text {
    func subtitled() -> Text {
        return self.foregroundColor(Color.gray).font(.system(size: 15))
    }
}
