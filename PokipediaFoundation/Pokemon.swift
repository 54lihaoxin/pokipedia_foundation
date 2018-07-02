//
//  Pokemon.swift
//  PokipediaFoundation
//
//  Created by Haoxin Li on 7/1/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import CoreData
import Foundation

public final class Pokemon: NSManagedObject {
    @NSManaged fileprivate(set) var identifier: String
    @NSManaged fileprivate(set) var name: String
}
