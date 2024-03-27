//
//  ImageStore.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import Foundation
import CoreImage

public protocol ImageStore {
    @discardableResult
    func save(_ image: CGImage, for url: URL) -> CGImage
    func getImage(for url: URL) -> CGImage?
}

public final class ImageStoreImpl: ImageStore {
    public static let shared = ImageStoreImpl()
    
    private let cache = NSCache<NSURL, CGImage>()
    
    @discardableResult
    public func save(_ image: CGImage, for url: URL) -> CGImage {
        NSURL(string: url.absoluteString)
            .map { (image, $0) }
            .map(cache.setObject)
        return image
    }
    
    public func getImage(for url: URL) -> CGImage? {
        NSURL(string: url.absoluteString)
            .flatMap(cache.object)
    }
    
    private init() {}

}
