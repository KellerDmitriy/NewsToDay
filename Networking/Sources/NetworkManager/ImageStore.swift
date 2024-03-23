//
//  ImageStore.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import Foundation
import CoreImage

final class ImageStore: ObservableObject {
    private var storage: [String: CGImage] = .init()
    
    func loadImage(for urlString: String) {
        Task(priority: .medium) { [weak self] in
            let result = URL(string: urlString)
                .flatMap(CIImage.init)
                .flatMap(\.cgImage)
                .map { ($0, urlString) }
        _ = await MainActor.run { result }
                .map { self?.storage.updateValue($0.0, forKey: $0.1) }
        }
    }
    
    func getImage(for urlString: String) -> CGImage? {
        storage[urlString]
    }
}
