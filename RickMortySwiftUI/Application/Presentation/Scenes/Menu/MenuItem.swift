//
//  MenuItem.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 31.05.2024.
//

import SwiftUI

struct MenuItem: View {
    let image: Image
    let name: String
    
    init(image: Image, name: String) {
        self.image = image
        self.name = name
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding(1)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .frame(width: 150, height: 150)
                Spacer()
                
                Text(name)
                    .font(.headline)
            }
            .padding(.vertical, 6)
            
            Divider()
        }
        .padding(.horizontal, 32)
        .frame(height: 170)
        .contentShape(Rectangle())
    }
}
