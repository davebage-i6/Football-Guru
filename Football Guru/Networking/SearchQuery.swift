//
//  SearchQuery.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//
import Foundation

struct SearchQuery {
    let searchString: String
    let searchType: String
    let offset: Int?
    
    var params: [URLQueryItem] {
        guard let offset = offset else {
            return [URLQueryItem(name: "searchString", value: searchString),
                    URLQueryItem(name: "searchType", value: searchType)]
        }
        
        return [
            URLQueryItem(name: "searchString", value: searchString),
            URLQueryItem(name: "searchType", value: searchType),
            URLQueryItem(name: "offset", value: String(offset))
        ]
    }
}
