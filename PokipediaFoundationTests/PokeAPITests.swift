//
//  PokeAPITests.swift
//  PokipediaFoundationTests
//
//  Created by Haoxin Li on 7/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import XCTest
@testable import PokipediaFoundation

class PokeAPITests: XCTestCase {
    
    static let timeout: TimeInterval = 5
    
    func testFetchPokemonDetails() {
        let expectation = XCTestExpectation(description: "Fetch pokemon details")
        
        PokeAPI.fetchPokemonDetails(forPokemonID: "1") { pokemonDetails in
            // TODO: test data
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: PokeAPITests.timeout)
    }
}
