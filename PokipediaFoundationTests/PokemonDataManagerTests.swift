//
//  PokemonDataManagerTests.swift
//  PokipediaFoundationTests
//
//  Created by Haoxin Li on 7/2/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import XCTest
@testable import PokipediaFoundation

class PokemonDataManagerTests: XCTestCase {
    
    private static let timeout: TimeInterval = 5
    
    func testNumberOfPokemons() {
        XCTAssertEqual(PokemonDataManager.shared.pokemons.count, PokemonDataManager.expectedNumberOfPokemons)
    }
    
    func testFetchPokemonDetails() {
        let expectation = XCTestExpectation(description: "Fetch pokemon details")
        let pokemonDataManager = PokemonDataManager()
        PokemonDataManager.fetchDetails(for: pokemonDataManager.pokemons[0]) { (pokemon, isSuccessful) in
            guard pokemon.details != nil, isSuccessful else {
                XCTFail()
                expectation.fulfill()
                return
            }
            Logger.log("\(#function): \(pokemon.description)")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: PokemonDataManagerTests.timeout)
    }
}
