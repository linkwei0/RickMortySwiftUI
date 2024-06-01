//
//  MenuViewState.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import SwiftUI

enum MenuViewEvent: CaseIterable, Identifiable {
    case episodes
    case characters
    case locations
    
    var image: Image {
        switch self {
        case .episodes:
            return Image(.episodes)
        case .characters:
            return Image(.characters)
        case .locations:
            return Image(.locations)
        }
    }
        
    var name: String {
        switch self {
        case .episodes:
            return "Эпизоды"
        case .characters:
            return "Персонажи"
        case .locations:
            return "Локации"
        }
    }
    
    var id: String { self.name }

}
