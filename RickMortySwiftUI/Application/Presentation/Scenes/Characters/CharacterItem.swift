//
//  CharacterItem.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import SwiftUI

struct CharacterItem: View {
    private let imageURL: URL?
    private let name: String
    
    init(imageURL: String, name: String) {
        self.imageURL = URL(string: imageURL)
        self.name = name
    }
    
    var body: some View {
        contentView
    }
    
    @ViewBuilder
    private var contentView: some View {
        VStack(alignment: .center) {
            HStack {
                CacheAsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 1)
                            }
                            .shadow(radius: 10)
                    case .failure:
                        Text("Failed to download image")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Spacer()
                
                Text(name)
                    .font(.headline)
            }
            .padding(.vertical, 10)

            Divider()
        }
        .padding(.horizontal, 24)
        .frame(height: 120)
    }
}
