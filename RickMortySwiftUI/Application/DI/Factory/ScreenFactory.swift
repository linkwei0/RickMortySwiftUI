//
//  ScreenFactory.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import Foundation

final class ScreenFactory: MenuCoordinatorFactory {
    private let appFactory: AppFactory
    
    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
}

// MARK: - MenuViewFactory
extension ScreenFactory: MenuViewFactory {
    func makeMenuView(coordinator: MenuCoordinatorProtocol) -> MenuView {
        let viewModel = MenuViewModel(coordinator: coordinator)
        let view = MenuView(viewModel: viewModel)
        return view
    }
}

// MARK: - EpisodesViewFactory
extension ScreenFactory: EpisodesViewFactory {
    func makeEpisodesView() -> EpisodesView {
        let viewModel = EpisodesViewModel(fetchEpisodesUseCase: appFactory.makeFetchEpisodesUseCase())
        let view = EpisodesView(viewModel: viewModel)
        return view
    }
}

// MARK: - CharactersViewFactory
extension ScreenFactory: CharactersViewFactory {
    func makeCharactersView() -> CharactersView {
        let viewModel = CharactersViewModel(fetchCharactersUseCase: appFactory.makeFetchCharactersUseCase())
        let view = CharactersView(viewModel: viewModel)
        return view
    }
}
