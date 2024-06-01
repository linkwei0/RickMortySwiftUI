//
//  MenuCoordinatorProtocol.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import Foundation

@MainActor
protocol MenuCoordinatorProtocol {
    func showEpisodes()
    func showCharacters()
    func showLocations()
}
