//
//  Webservice.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI
import Combine

class Webservice {
    @Published var resultsFound = false
    func fetchResults<T: Codable>(expecting: T.Type, query: SearchQuery) -> AnyPublisher<T, Error> {
        
        let baseURL = "https://trials.mtcmobile.co.uk/api/football/1.0/search"
        
        let endpoint = Endpoint(baseUrl: baseURL, params: query.params)
        
        guard let url = endpoint.url() else {
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
