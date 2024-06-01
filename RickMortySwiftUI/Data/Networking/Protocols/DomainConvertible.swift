//
//  DomainConvertible.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

protocol DomainConvertible {
    associatedtype Domain
    func asDomain() -> Domain
}
