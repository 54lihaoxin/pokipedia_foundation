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
    
    func testNumberOfPokemons() {
        XCTAssertEqual(PokemonDataManager.shared.pokemons.count, PokemonDataManager.expectedNumberOfPokemons)
    }
}
