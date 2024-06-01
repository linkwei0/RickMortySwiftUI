//
//  EpisodeRepositoryImpl.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

final class EpisodeRepositoryImpl {
    private let remoteDataSource: EpisodeRemoteDataSource
    
    init(remoteDataSource: EpisodeRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - EpisodeRepository
extension EpisodeRepositoryImpl: EpisodeRepository {
    func getEpisodes() async throws -> [Episode] {
        let episodesDTO = try await remoteDataSource.fecthEpisodes()
        let episodes = episodesDTO.map { $0.asDomain() }
        return episodes
    }
}
