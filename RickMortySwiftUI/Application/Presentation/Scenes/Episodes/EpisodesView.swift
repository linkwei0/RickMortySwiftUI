//
//  EpisodesView.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject private var viewModel: EpisodesViewModel
    
    init(viewModel: EpisodesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        contentView
            .backgroundColor()
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                viewModel.handle(.onAppear)
            }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .error(let error):
            Text(error)
        case .loaded(let viewData):
            setupListView(with: viewData.listItems)
        }
    }
    
    private func setupListView(with items: [EpisodeItemViewModel]) -> some View {
        ScrollView {
            VStack {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    EpisodeItem(index: index, name: item.name)
                }
            }
        }
    }
}
