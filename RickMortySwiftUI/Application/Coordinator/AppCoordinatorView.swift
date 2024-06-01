//
//  AppCoordinatorView.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import SwiftUI

struct AppCoordinatorView: View {
    private let screenFactory: ScreenFactory
    @ObservedObject private var coordinator: AppCoordinator
    
    init(screenFactory: ScreenFactory, coordinator: AppCoordinator) {
        self.screenFactory = screenFactory
        self.coordinator = coordinator
    }
    
    var body: some View {
        sceneView
    }
    
    @ViewBuilder
    private var sceneView: some View {
        switch coordinator.state {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .menu:
            MenuCoordinatorView(factory: screenFactory, coordinator: MenuCoordinator())
        }
    }
}
