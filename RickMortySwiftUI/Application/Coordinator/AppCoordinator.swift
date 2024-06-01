//
//  AppCoordinator.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import Foundation

final class AppCoordinator: ObservableObject {
    enum State {
        case idle
        case loading
        case menu
    }
    
    enum Action {
        case showMenu
    }
    
    @Published private(set) var state: State
    
    init() {
//        self.state = .idle
        self.state = .menu
    }
    
    func handle(_ action: Action) {
        switch action {
        case .showMenu:
            state = .menu
        }
    }
}
