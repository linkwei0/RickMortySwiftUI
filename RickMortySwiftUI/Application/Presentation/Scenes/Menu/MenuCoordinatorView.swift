//
//  MenuCoordinatorView.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import SwiftUI

struct MenuCoordinatorView: View {
    private let factory: MenuCoordinatorFactory
    @ObservedObject private var coordinator: MenuCoordinator
    
    init(factory: MenuCoordinatorFactory, coordinator: MenuCoordinator) {
        self.factory = factory
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeMenuView(coordinator: coordinator)
                .navigationDestination(for: MenuCoordinator.Screen.self) { nextScreen in
                    destination(nextScreen)
                }
                .navigationTitle("Главная")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    @ViewBuilder
    private func destination(_ screen: MenuCoordinator.Screen) -> some View {
        switch screen {
        case .episodes:
            factory.makeEpisodesView()
        case .characters:
            factory.makeCharactersView()
        case .locations:
            EmptyView()
        }
    }
}
