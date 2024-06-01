//
//  URLRequest+Headers.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

extension URLRequest {
    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
    
    mutating func setHeader(for httpHeaderField: String, with value: String) {
        setValue(value, forHTTPHeaderField: httpHeaderField)
    }
}
