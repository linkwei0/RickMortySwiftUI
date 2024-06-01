//
//  CharactersView.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel: CharactersViewModel
    
    init(viewModel: CharactersViewModel) {
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
        case .error(let errorText):
            Text(errorText)
        case .loaded(let viewData):
            setupListView(with: viewData.listItems)
        }
    }
    
    private func setupListView(with itemsViewModel: [CharacterItemViewModel]) -> some View {
        ScrollView {
            VStack {
                ForEach(itemsViewModel) { itemViewModel in
                    CharacterItem(imageURL: itemViewModel.imageURL, name: itemViewModel.name)
                }
            }
        }
    }
}
