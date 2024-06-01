//
//  CharacterRepository.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

protocol CharacterRepository {
    func getCharacters() async throws -> [Character]
}
