//
//  CharactersViewModel.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

struct CharacterItemViewModel: Identifiable {
    let id: String
    let name: String
    let imageURL: String
}

enum CharactersViewEvent {
    case onAppear
    case didSelectCharacter(String)
}

enum CharactersViewState {
    case loading
    case error(String)
    case loaded(ViewData)
    
    struct ViewData {
        let listItems: [CharacterItemViewModel]
    }
}

@MainActor
class CharactersViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var state: CharactersViewState
    
    private let fetchCharactersUseCase: FetchCharactersUseCase
    
    // MARK: - Init
    init(fetchCharactersUseCase: FetchCharactersUseCase) {
        self.state = .loading
        self.fetchCharactersUseCase = fetchCharactersUseCase
    }
    
    // MARK: - Public methods
    func handle(_ event: CharactersViewEvent) {
        switch event {
        case .onAppear:
            Task {
                await loadData()
            }
        case .didSelectCharacter(let characterID):
            print("show character with id - \(characterID)")
        }
    }
    
    // MARK: - Private methods
    private func loadData() async {
        do {
            let characters = try await fetchCharactersUseCase.execute()
            let viewData = configureViewData(characters)
            state = .loaded(viewData)
        } catch {
            print("Failed to get characters with \(error.localizedDescription)")
            state = .error("\(error.localizedDescription)")
        }
    }
    
    private func configureViewData(_ characters: [Character]) -> CharactersViewState.ViewData {
        let itemViewModels = configureItemViewModels(characters)
        let viewData = CharactersViewState.ViewData(listItems: itemViewModels)
        return viewData
    }
    
    private func configureItemViewModels(_ characters: [Character]) -> [CharacterItemViewModel] {
        return characters.map { character in
            CharacterItemViewModel(id: character.id, name: character.name, imageURL: character.imageURL)
        }
    }
}
