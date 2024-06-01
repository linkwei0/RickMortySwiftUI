//
//  View+BackgroundColor.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import SwiftUI

struct BackgroundColorViewModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            color
                .ignoresSafeArea()
            
            content
        }
    }
}

extension View {
    func backgroundColor(_ color: Color = .background) -> some View {
        modifier(BackgroundColorViewModifier(color: color))
    }
}
