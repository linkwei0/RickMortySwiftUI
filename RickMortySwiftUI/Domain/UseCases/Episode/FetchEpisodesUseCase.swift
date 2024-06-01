//
//  FetchEpisodesUseCase.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

final class FetchEpisodesUseCase {
    private let episodeRepository: EpisodeRepository
    
    init(episodeRepository: EpisodeRepository) {
        self.episodeRepository = episodeRepository
    }
    
    func execute() async throws -> [Episode] {
        return try await episodeRepository.getEpisodes()
    }
}
