//
//  MenuCoordinator.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import Foundation

final class MenuCoordinator: Coordinator {
    enum Screen: Routable {
        case episodes
        case characters
        case locations
    }
    
    @Published var navigationPath: [Screen] = []
}

// MARK: - MenuCoordinatorProtocol
extension MenuCoordinator: MenuCoordinatorProtocol {
    func showEpisodes() {
        print("Show episodes")
        navigationPath.append(.episodes)
    }
    
    func showCharacters() {
        print("Show characters")
        navigationPath.append(.characters)
    }
    
    func showLocations() {
        print("Show locations")
        navigationPath.append(.locations)
    }
}
