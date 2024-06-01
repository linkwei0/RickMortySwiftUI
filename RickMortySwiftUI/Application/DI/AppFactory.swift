//
//  AppFactory.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import Foundation

final class AppFactory {
    private lazy var networkService = NetworkService()
    
    private lazy var episodeRepository: EpisodeRepository = {
        let remoteDataSource = EpisodeRemoteDataSource(networkService: networkService)
        return EpisodeRepositoryImpl(remoteDataSource: remoteDataSource)
    }()
    
    private lazy var characterRepository: CharacterRepository = {
        let remoteDataSource = CharacterRemoteDataSource(networkSerivce: networkService)
        return CharacterRepositoryImpl(remoteDataSource: remoteDataSource)
    }()
}

// MARK: - EpisodeUseCases
extension AppFactory {
    func makeFetchEpisodesUseCase() -> FetchEpisodesUseCase {
        return FetchEpisodesUseCase(episodeRepository: episodeRepository)
    }
}

// MARK: - CharacterUseCases
extension AppFactory {
    func makeFetchCharactersUseCase() -> FetchCharactersUseCase {
        return FetchCharactersUseCase(characterRepository: characterRepository)
    }
}
