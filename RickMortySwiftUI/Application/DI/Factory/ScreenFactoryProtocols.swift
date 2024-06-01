//
//  ScreenFactoryProtocols.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import Foundation

@MainActor
protocol MenuViewFactory {
    func makeMenuView(coordinator: MenuCoordinatorProtocol) -> MenuView
}

@MainActor 
protocol EpisodesViewFactory {
    func makeEpisodesView() -> EpisodesView
}

@MainActor
protocol CharactersViewFactory {
    func makeCharactersView() -> CharactersView
}
