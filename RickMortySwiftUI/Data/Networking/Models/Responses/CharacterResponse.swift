//
//  CharacterResponse.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

struct CharacterResponse: Decodable {
    let info: InfoApi
    let results: [CharacterDTO]
}
