//
//  AsyncImageView.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 27.03.2024.
//

import SwiftUI

public struct AsyncImageView<C: View>: View {
    @Environment(\.displayScale) private var displayScale
    
    private let cache: ImageStore
    private let url: URL?
    private let configureImage: (Image) -> C
    @State private var image: Image?
    
    //MARK: - init(_:)
    public init(
        _ urlString: String?,
        cache: ImageStore = ImageStoreImpl.shared,
        configureImage: @escaping (Image) -> C = { $0 }
    ) {
        self.url = urlString.flatMap(URL.init)
        self.cache = cache
        self.configureImage = configureImage
    }
    
    //MARK: - Body
    public var body: some View {
        Group {
            switch self.image {
            case .some(let image):
                configureImage(image)
                
            case .none:
                Image(systemName: "photo")
                    .redacted(reason: .placeholder)
            }
        }
        .task {
            self.image = await getUIImage().map(Image.init)
        }
    }
    
    private func getUIImage() async -> UIImage? {
        try? await url.asyncMap(URLSession.shared.data(from:))
            .map(\.0)
            .flatMap(UIImage.init)
    }
    
    private func getImage() async -> Image? {
        await getRawImageData()
            .map(saveImageToCache)
            .map { ($0, displayScale) }
            .map { Image(decorative: $0, scale: $1) }
    }
    
    private func getRawImageData() async -> CGImage? {
        switch self.url.flatMap(cache.getImage) {
        case .some(let cgImage):
            return cgImage
            
        case .none:
            return self.url
                .flatMap(CIImage.init)
//                .asyncMap(URLSession.shared.data(from:))
//                .map(\.0)
//                .flatMap(CIImage.init)
                .flatMap(\.cgImage)
            }
    }
    
    private func saveImageToCache(_ cgImage: CGImage) -> CGImage {
        guard let url else { return cgImage }
        return cache.save(cgImage, for: url)
    }
}

extension Optional {
    @inlinable
    func asyncMap<T>(
        _ transform: (Wrapped) async throws -> T
    ) async rethrows -> T? {
        switch self {
        case .none:
            return .none
        case .some(let wrapped):
            let transformed = try await transform(wrapped)
            return .some(transformed)
        }
    }
}

#Preview {
    AsyncImageView("https://buffer.com/library/content/images/size/w1200/2023/09/instagram-image-size.jpg")
}

