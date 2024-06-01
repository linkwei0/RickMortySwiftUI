//
//  CharacterRemoteDataSource.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

final class CharacterRemoteDataSource {
    private let networkSerivce: NetworkService
    
    init(networkSerivce: NetworkService) {
        self.networkSerivce = networkSerivce
    }
}

extension CharacterRemoteDataSource {
    func fetchCharacters() async throws -> [CharacterDTO] {
        let request = CharacterEndpoint.getCharacters.request
        let characterResponse: CharacterResponse = try await networkSerivce.fetch(with: request)
        return characterResponse.results
    }
}
