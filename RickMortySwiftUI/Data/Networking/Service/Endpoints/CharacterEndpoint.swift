//
//  CharacterEndpoint.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

enum CharacterEndpoint {
    case getCharacters
}

extension CharacterEndpoint: Endpoint {
    var base: String {
        return NetworkConfiguration.shared.basePath
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/api/character"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        switch self {
        case .getCharacters:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }
}
