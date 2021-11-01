//
//  Endpoint.swift
//  Football Guru
//
//  Created by Dave Bage on 29/10/2021.
//

import Foundation

struct Endpoint {
    let baseUrl: String
    let params: [URLQueryItem]
    
    func url() -> URL? {
        var url = URLComponents(string: baseUrl)
        url?.queryItems = params
        return url?.url
    }
}
