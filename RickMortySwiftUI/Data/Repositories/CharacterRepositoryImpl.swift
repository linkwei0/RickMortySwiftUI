//
//  CharacterRepositoryImpl.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

final class CharacterRepositoryImpl {
    private let remoteDataSource: CharacterRemoteDataSource
    
    init(remoteDataSource: CharacterRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - CharacterRepository
extension CharacterRepositoryImpl: CharacterRepository {
    func getCharacters() async throws -> [Character] {
        let charactersDTO = try await remoteDataSource.fetchCharacters()
        let characters = charactersDTO.map { $0.asDomain() }
        return characters
    }
}
