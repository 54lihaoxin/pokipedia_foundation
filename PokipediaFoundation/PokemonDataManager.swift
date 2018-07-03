//
//  PokemonDataManager.swift
//  PokipediaFoundation
//
//  Created by Haoxin Li on 7/2/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

public final class PokemonDataManager {
    
    public static let shared = PokemonDataManager()
    public static let expectedNumberOfPokemons = 802
    public let pokemons: [Pokemon] // sorted by Pokemon ID
    
    init() {
        pokemons = PokemonDataManager.loadPokemons()
    }
}

// MARK: - private helpers

private extension PokemonDataManager {
    
    /// Load a sorted (by Pokemon ID) list of all pokemons from pokemon_list.csv by default.
    static func loadPokemons(fromCSVResource resource: String = "pokemon_list") -> [Pokemon] {
        guard let filePath = Bundle.pokipediaFoundationResource.path(forResource: resource, ofType: "csv") else {
            fatalError("\(#function) file path does not exist")
        }
        guard let content = try? String(contentsOfFile: filePath) else {
            fatalError("\(#function) failed to load pokemons from file [\(filePath)]")
        }
        
        var pokemons: [Pokemon] = []
        pokemons.reserveCapacity(PokemonDataManager.expectedNumberOfPokemons)
        
        for row in content.components(separatedBy: "\n") {
            let elements = row.components(separatedBy: ",")
            guard elements.count == 2 else {
                continue // probably the newline at the end of the CSV file
            }
            pokemons.append(Pokemon(identifier: elements[0], name: elements[1]))
        }
        
        return pokemons
    }
}
