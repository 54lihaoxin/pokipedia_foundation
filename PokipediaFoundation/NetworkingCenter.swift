//
//  NetworkingCenter.swift
//  PokipediaFoundation
//
//  Created by Haoxin Li on 7/2/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

final class NetworkingCenter {
    
    struct HTTPResponseStatusCode {
        static let success = 200
    }
    
    enum Result {
        case success(data: Data)
        case failure(error: NetworkingFailure)
    }
    
    enum NetworkingFailure: Error {
        case noData
        case unexpectedHTTPResponseCode(code: Int?)
        case dataTaskError(localizedDescription: String)
    }
    
    static func getRequest(url: URL, completion: @escaping (Result) -> Void) {
        Logger.log("\(#function) URL: \(url)")
        URLSession.shared.dataTask(with: url) { (data, urlResponse, dataTaskError) in
            guard let data = data else {
                completion(.failure(error: .noData))
                return
            }
            guard let httpURLResponse = urlResponse as? HTTPURLResponse else {
                completion(.failure(error: .unexpectedHTTPResponseCode(code: nil)))
                return
            }
            guard httpURLResponse.statusCode == HTTPResponseStatusCode.success else {
                completion(.failure(error: .unexpectedHTTPResponseCode(code: httpURLResponse.statusCode)))
                return
            }
            if let dataTaskError = dataTaskError {
                completion(.failure(error: .dataTaskError(localizedDescription: dataTaskError.localizedDescription)))
                return
            }
            completion(.success(data: data))
        }.resume()
    }
}
