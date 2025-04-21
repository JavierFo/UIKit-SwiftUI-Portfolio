//
//  CoinAPIError.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/16/25.
//

import Foundation

enum CoinAPIError: Error{
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case.invalidData: return "invalid data"
        case .jsonParsingFailure: return "failed to parse json"
        case let .requestFailed(description): return "Request failed \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code \(statusCode)"
        case let .unknownError(error): return "An unknown error ocurred \(error.localizedDescription)"
        }
    }
    
}
