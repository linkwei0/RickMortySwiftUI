//
//  MenuView.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import SwiftUI

struct MenuView: View {
    // MARK: - Properties
    @ObservedObject private var viewModel: MenuViewModel
    
    // MARK: - Init
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    var body: some View {
        contentView
            .backgroundColor()
    }
    
    private var contentView: some View {
        setupListView()
    }
    
    private func setupListView() -> some View {
        ScrollView {
            VStack {
                ForEach(MenuViewEvent.allCases) { event in
                    MenuItem(image: event.image, name: event.name)
                        .onTapGesture {
                            viewModel.handle(event)
                        }
                }
            }
        }
    }
}
