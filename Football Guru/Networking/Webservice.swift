//
//  Webservice.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI
import Combine

class Webservice {    
    func fetchResults<T: Codable>(input: String, expecting: T.Type, searchType: String) -> AnyPublisher<T, Error> {
        
        var baseURL = URLComponents(string: "https://trials.mtcmobile.co.uk/api/football/1.0/search")
        baseURL?.queryItems = [
            URLQueryItem(name: "searchString", value: input),
            URLQueryItem(name: "searchType", value: searchType)
        ]
        
        guard let url = baseURL?.url else {
            fatalError("Unable to get url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                return data
            }
            .decode(type: expecting, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
