//
//  EpisodeRepository.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

protocol EpisodeRepository {
    func getEpisodes() async throws -> [Episode]
}
