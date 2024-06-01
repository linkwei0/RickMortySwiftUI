//
//  EpisodeRemoteDataSource.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

final class EpisodeRemoteDataSource {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension EpisodeRemoteDataSource {
    func fecthEpisodes() async throws -> [EpisodeDTO] {
        let request = EpisodeEndpoint.getEpisodes.request
        let episodeResponse: EpisodesResponse = try await networkService.fetch(with: request)
        return episodeResponse.results
    }
}
