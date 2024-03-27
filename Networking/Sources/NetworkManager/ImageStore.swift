//
//  ImageStore.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import UIKit

public final class ImageStore {
    public static let shared = ImageStore()
    
    private let cache = NSCache<NSURL, UIImage>()
    
    func save(_ image: UIImage, for urlString: String) {
        NSURL(string: urlString)
            .map { (image, $0) }
            .map(cache.setObject)
    }
    
    func getImage(for urlString: String) -> UIImage? {
        NSURL(string: urlString)
            .flatMap(cache.object)
    }
    
    private init() {}

}
