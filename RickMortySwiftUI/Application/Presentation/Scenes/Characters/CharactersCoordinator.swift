//
//  CharactersCoordinator.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

protocol CharactersCoordinatorProtocol {}

class CharactersCoordinator: Coordinator {
    enum Screen: Routable {
        
    }
    
    @Published var navigationPath: [Screen] = []
}

// MARK: - CharactersCoordinatorProtocol
extension CharactersCoordinator: CharactersCoordinatorProtocol {}
