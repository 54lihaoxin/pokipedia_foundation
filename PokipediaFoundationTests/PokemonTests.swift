//
//  PokemonTests.swift
//  PokipediaFoundationTests
//
//  Created by Haoxin Li on 7/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import XCTest
@testable import PokipediaFoundation

class PokemonTests: XCTestCase {
    
    func testDecodableForPokemon1() {
        let bundle = Bundle(for: self.classForCoder)
        guard let jsonFileURL = bundle.url(forResource: "pokemon_1", withExtension: "json") else {
            fatalError("\(#function) test JSON file not found")
        }
        guard let jsonData = try? Data(contentsOf: jsonFileURL) else {
            fatalError("\(#function) failed to read data from JSON file")
        }
        
        let pokemonDetails: Pokemon.Details
        do {
            pokemonDetails = try JSONDecoder().decode(Pokemon.Details.self, from: jsonData)
        } catch {
            XCTFail("\(#function) failed to decode JSON for `PokemonDetails`")
            return
        }
        
        // test general info
        XCTAssertEqual(pokemonDetails.name, "bulbasaur")
        XCTAssertEqual(pokemonDetails.weight, 69)
        XCTAssertEqual(pokemonDetails.height, 7)
        
        // test `abilities`
        XCTAssertEqual(pokemonDetails.abilities.count, 2)
        XCTAssertEqual(pokemonDetails.abilities[0].name, "chlorophyll")
        XCTAssertEqual(pokemonDetails.abilities[0].url.absoluteString, "https://pokeapi.co/api/v2/ability/34/")
        XCTAssertEqual(pokemonDetails.abilities[1].name, "overgrow")
        XCTAssertEqual(pokemonDetails.abilities[1].url.absoluteString, "https://pokeapi.co/api/v2/ability/65/")
    }
}
