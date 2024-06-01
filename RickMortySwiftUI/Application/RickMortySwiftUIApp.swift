//
//  RickMortySwiftUIApp.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import SwiftUI

@main
struct RickMortySwiftUIApp: App {
    private let appFactory = AppFactory()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(screenFactory: ScreenFactory(appFactory: appFactory),
                               coordinator: AppCoordinator())
            .preferredColorScheme(.dark)
        }
    }
}
