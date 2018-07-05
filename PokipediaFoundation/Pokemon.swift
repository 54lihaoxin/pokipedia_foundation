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
        private enum CodingKeys: String, CodingKey {
            case name
            case weight
            case height
            case abilities
        }
        
        public let name: String
        public let weight: Double
        public let height: Double
        public let abilities: [Ability]
    }
    
    public struct Ability: Decodable {
        private enum CodingKeys: String, CodingKey {
            case ability
        }
        
        private enum AbilityCodingKeys: String, CodingKey {
            case name
            case url
        }
        
        public let name: String
        public let url: URL
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            if values.contains(.ability) {
                let ability = try values.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
                name = try ability.decode(String.self, forKey: .name)
                let urlString = try ability.decode(String.self, forKey: .url)
                guard let url = URL(string: urlString) else {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "URL string [\(urlString)] is not valid"))
                }
                self.url = url
            } else {
                throw DecodingError.keyNotFound(CodingKeys.ability, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: ""))
            }
        }
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
