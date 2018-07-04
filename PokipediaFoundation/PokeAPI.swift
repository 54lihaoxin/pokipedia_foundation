//
//  PokeAPI.swift
//  PokipediaFoundation
//
//  Created by Haoxin Li on 7/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

struct PokeAPI {
    
    static let host = "https://pokeapi.co"
    
    enum Endpoint {
        case pokemonDetails(pokemonID: String)
    }
    
    static func fetchPokemonDetails(forPokemonID pokemonID: String, completion: @escaping (Pokemon.Details?) -> Void) {
        let endpoint = Endpoint.pokemonDetails(pokemonID: pokemonID)
        NetworkingCenter.getRequest(url: endpoint.url()) { result in
            switch result {
            case .success(let data):
                if let pokemonDetails = try? JSONDecoder().decode(Pokemon.Details.self, from: data) {
                    Logger.log("\(#function) pokemon details: \(pokemonDetails)") // TODO
                } else {
                    Logger.log("\(#function) parsing faild") // TODO
                }
            case .failure(let error):
                break // TODO: error handling
            }
            DispatchQueue.main.async {
                completion(nil) // TODO
            }
        }
    }
}

private extension PokeAPI.Endpoint {
    
    func url(with queryItems: [URLQueryItem]? = nil) -> URL {
        guard var urlComponents = URLComponents(string: PokeAPI.host) else {
            fatalError("\(#function) unable to obtain a URL from \(PokeAPI.host)")
        }
        
        switch self {
        case .pokemonDetails(let pokemonID): urlComponents.path = "/api/v2/pokemon/\(pokemonID)"
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            fatalError("\(#function) unable to obtain a URL from URL components \(urlComponents)")
        }
        return url
    }
}
