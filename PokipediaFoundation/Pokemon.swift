//
//  Pokemon.swift
//  PokipediaFoundation
//
//  Created by Haoxin Li on 7/1/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

public final class Pokemon {
    public let identifier: String
    public let name: String
    public var details: Details?
    
    public struct Details: Decodable {
    }
    
    public init(identifier: String, name: String) {
        self.identifier = identifier
        self.name = name
    }
}

extension Pokemon: CustomStringConvertible {
    
    public var description: String {
        return "\(identifier) - \(name)"
    }
}
