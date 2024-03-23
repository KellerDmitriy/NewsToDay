//
//  ImageStore.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import Foundation
import CoreImage

final class ImageStore: ObservableObject {
    private let cache = NSCache<NSURL, CGImage>()
    
    func save(_ image: CGImage, for urlString: String) {
        NSURL(string: urlString)
            .map { (image, $0) }
            .map(cache.setObject)
    }
    
    func getImage(for urlString: String) -> CGImage? {
        NSURL(string: urlString)
            .flatMap(cache.object)
    }

}
