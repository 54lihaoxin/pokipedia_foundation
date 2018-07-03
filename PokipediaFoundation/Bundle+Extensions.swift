//
//  Bundle+Extensions.swift
//  PokipediaFoundation
//
//  Created by Haoxin Li on 7/2/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

public extension Bundle {
    
    public static var pokipediaFoundationResource: Bundle {
        let baseBundle = Bundle(for: Pokemon.self)
        if ProcessInfo.processInfo.environment["ignore_cocoapods_bundling"] == "true" {
            return baseBundle
        } else { // podspec -> resource_bundles will package resource files into Resource.bundle
            guard let bundleURL = baseBundle.resourceURL?.appendingPathComponent("Resource.bundle") else {
                fatalError("\(#function) invalid bundle URL")
            }
            guard let bundle = Bundle(url: bundleURL) else {
                fatalError("\(#function) bundle not found for URL \(bundleURL)")
            }
            return bundle
        }
    }
}
