//
//  Logger.swift
//  PokipediaFoundation
//
//  Created by Haoxin Li on 7/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

struct Logger {
    
    enum Level: String {
        case debug
        case error
    }
    
    static func log(_ message: String, level: Level = .debug) {
        switch level {
        case .debug:
            #if DEBUG
            print("[\(level)] \(message)")
            #else
            break // no op
            #endif
        case .error:
            print("[\(level)] \(message)")
        }
    }
    
    static func logError(_ message: String) {
        log(message, level: .error)
    }
}
