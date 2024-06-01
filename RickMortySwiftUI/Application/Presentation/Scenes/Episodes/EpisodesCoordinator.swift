//
//  EpisodesCoordinator.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

protocol EpisodesCoordinatorProtocol {}

class EpisodesCoordinator: Coordinator {
    enum Screen: Routable {}
    
    @Published var navigationPath: [Screen] = []
}

// MARK: - EpisodesCoordinatorProtocol
extension EpisodesCoordinator: EpisodesCoordinatorProtocol {}
