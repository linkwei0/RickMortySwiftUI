//
//  NetworkConfiguration.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

final class NetworkConfiguration {
    static let shared = NetworkConfiguration()
    
    let basePath = "https://rickandmortyapi.com"
    
    private init() {}
}
