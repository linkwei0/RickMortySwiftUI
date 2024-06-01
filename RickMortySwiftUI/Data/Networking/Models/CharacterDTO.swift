//
//  CharacterDTO.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension CharacterDTO: DomainConvertible {
    func asDomain() -> Character {
        return Character(id: "\(id)", name: name, imageURL: image)
    }
}
