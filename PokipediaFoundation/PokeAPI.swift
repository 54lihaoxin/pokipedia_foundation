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
    
    enum FetchPokemonDetailsResult {
        case success(pokemonDetails: Pokemon.Details)
        case failure(error: Error)
    }
    
    static func fetchPokemonDetails(forPokemonID pokemonID: String, completion: @escaping (FetchPokemonDetailsResult) -> Void) {
        let endpoint = Endpoint.pokemonDetails(pokemonID: pokemonID)
        NetworkingCenter.getRequest(url: endpoint.url()) { apiResult in
            let result: FetchPokemonDetailsResult
            switch apiResult {
            case .success(let data):
                do {
                    let pokemonDetails = try JSONDecoder().decode(Pokemon.Details.self, from: data)
                    result = .success(pokemonDetails: pokemonDetails)
                } catch {
                    assertionFailure("\(#function) decoding faild: \(error.localizedDescription)")
                    result = .failure(error: error)
                }
            case .failure(let error):
                result = .failure(error: error)
            }
            completion(result)
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
