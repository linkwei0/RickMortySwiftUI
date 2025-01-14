//
//  CacheAsyncImage.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import SwiftUI

@MainActor
final class ImageCache {
    static private var cache = [URL: Image]()
    static subscript(url: URL?) -> Image? {
        get {
            guard let url else { return nil }
            return cache[url]
        }
        set {
            guard let url else { return }
            cache[url] = newValue
        }
    }
}

struct CacheAsyncImage<Content>: View where Content: View {
    
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction?
    
    private let placeholder: (() -> Content)?
    private let contentImage: ((Image) -> Content)?
    private let contentPhase: ((AsyncImagePhase) -> Content)?
    
    init(
        url: URL?,
        scale: CGFloat = 1,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.contentPhase = content
        self.contentImage = nil
        self.placeholder = nil
    }
    
    init(
        url: URL?,
        scale: CGFloat = 1,
        @ViewBuilder content: @escaping (Image) -> Content,
        @ViewBuilder placeholder: @escaping () -> Content
    ) {
        self.url = url
        self.scale = scale
        self.contentImage = content
        self.placeholder = placeholder
        self.contentPhase = nil
        self.transaction = nil
    }
    
    var body: some View {
        if let cached = ImageCache[url] {
            contentImage != nil ? contentImage?(cached) : contentPhase?(.success(cached))
        } else {
            if contentPhase != nil {
                AsyncImage(
                    url: url,
                    scale: scale,
                    transaction: transaction ?? Transaction(),
                    content: { cacheAndRender(phase: $0) }
                )
            } else if contentImage != nil, placeholder != nil {
                AsyncImage(
                    url: url,
                    scale: scale,
                    content: { cacheAndRender(image: $0) },
                    placeholder: placeholder!
                )
            }
        }
    }
    
    @MainActor private func cacheAndRender(image: Image) -> some View {
        ImageCache[url] = image
        return contentImage?(image)
    }
    
    @MainActor private func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        return contentPhase?(phase)
    }
}
