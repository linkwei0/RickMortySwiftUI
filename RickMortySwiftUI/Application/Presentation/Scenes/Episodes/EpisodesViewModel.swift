//
//  EpisodesViewModel.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

struct EpisodeItemViewModel: Identifiable {
    let id: String
    let name: String
}

enum EpisodesViewEvent {
    case onAppear
}

enum EpisodesViewState {
    case loading
    case error(String)
    case loaded(ViewData)
    
    struct ViewData {
        var listItems: [EpisodeItemViewModel]
    }
}

@MainActor
class EpisodesViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var state: EpisodesViewState
    
    private let fetchEpisodesUseCase: FetchEpisodesUseCase
    
    // MARK: - Init
    init(fetchEpisodesUseCase: FetchEpisodesUseCase) {
        self.state = .loading
        self.fetchEpisodesUseCase = fetchEpisodesUseCase
    }
    
    // MARK: - Public methods
    func handle(_ event: EpisodesViewEvent) {
        switch event {
        case .onAppear:
            Task {
                await loadData()
            }
        }
    }
    
    // MARK: - Private methods
    private func loadData() async {
        do {
            let episodes = try await fetchEpisodesUseCase.execute()
            let viewData = configureViewData(episodes)
            state = .loaded(viewData)
        } catch {
            print("Failed to fetch episodes with \(error.localizedDescription)")
            state = .error("\(error.localizedDescription)")
        }
    }
    
    private func configureViewData(_ episodes: [Episode]) -> EpisodesViewState.ViewData {
        let itemViewModels = makeItemViewModels(episodes)
        return EpisodesViewState.ViewData(listItems: itemViewModels)
    }
    
    private func makeItemViewModels(_ episodes: [Episode]) -> [EpisodeItemViewModel] {
        return episodes.map { episode in
            EpisodeItemViewModel(id: UUID().uuidString, name: episode.name)
        }
    }
}
