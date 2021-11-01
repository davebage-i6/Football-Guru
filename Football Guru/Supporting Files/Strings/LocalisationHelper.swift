//
//  LocalisationHelper.swift
//  Football Guru
//
//  Created by Dave Bage on 31/10/2021.
//

import Foundation

/*
 Defines a protocol allowing enum values to be marked as strings. This way
 the correct strings file from the i6 library can be used in the lookup
 */

public protocol FootballGuruString {
    var localized: String { get }
}

public extension FootballGuruString where Self: RawRepresentable, Self.RawValue == String {
    
    var localized: String {
        return NSLocalizedString(rawValue, tableName: "FootballGuruStrings", bundle: FootballGuruBundle.shared, value: "**\(self)**", comment: "")
    }
}
