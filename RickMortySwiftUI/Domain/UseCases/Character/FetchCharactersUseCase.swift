//
//  FetchCharactersUseCase.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

final class FetchCharactersUseCase {
    private let characterRepository: CharacterRepository
    
    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }
    
    func execute() async throws -> [Character] {
        return try await characterRepository.getCharacters()
    }
}
