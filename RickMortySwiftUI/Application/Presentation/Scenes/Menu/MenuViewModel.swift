//
//  MenuViewModel.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import Foundation

@MainActor
class MenuViewModel: ObservableObject {
    private let coordinator: MenuCoordinatorProtocol
    
    init(coordinator: MenuCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func handle(_ event: MenuViewEvent) {
        switch event {
        case .episodes:
            coordinator.showEpisodes()
        case .characters:
            coordinator.showCharacters()
        case .locations:
            coordinator.showLocations()
        }
    }
}
