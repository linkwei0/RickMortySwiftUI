//
//  EpisodeItem.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import SwiftUI

struct EpisodeItem: View {
    let index: Int
    let name: String
    
    init(index: Int, name: String) {
        self.index = index + 1
        self.name = name
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("#\(index)")
                    .foregroundStyle(.black)
                    .font(.footnote)

                Text(name)
                    .foregroundStyle(.black)
                    .font(.headline)
            }
            .padding(.vertical, 6)
            
            Divider()
        }
        .frame(minHeight: 50)
        .padding(.horizontal, 32)
    }
}
