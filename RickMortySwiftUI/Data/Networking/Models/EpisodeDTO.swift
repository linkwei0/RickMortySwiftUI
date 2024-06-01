//
//  EpisodeDTO.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

struct EpisodeDTO: Decodable {
    let id: Int
    let name: String
    let date: String
    let episodeSeason: String
    let characters: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, characters
        case date = "air_date"
        case episodeSeason = "episode"
    }
}

extension EpisodeDTO: DomainConvertible {
    func asDomain() -> Episode {
        return Episode(name: name)
    }
}
