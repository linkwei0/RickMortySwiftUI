//
//  EpisodeEndpoint.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

enum EpisodeEndpoint {
    case getEpisodes
}

extension EpisodeEndpoint: Endpoint {
    var base: String {
        return NetworkConfiguration.shared.basePath
    }
    
    var path: String {
        switch self {
        case .getEpisodes:
            return "/api/episode"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        switch self {
//        case .getEpisodes(let page):
//            return ["page": page]
        case .getEpisodes:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getEpisodes:
            return .get
        }
    }
}
