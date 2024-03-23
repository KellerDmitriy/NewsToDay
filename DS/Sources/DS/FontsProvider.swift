//
//  FontsProvider.swift
//
//
//  Created by dsm 5e on 23.03.2024.
//

import Foundation
import CoreGraphics
import CoreText

public struct FontsProvider {
    
    public enum Inter: String, CaseIterable {
        case thin = "Inter-Thin"
        case semiBold = "Inter-SemiBold"
        case regular = "Inter-Regular"
        case medium = "Inter-Medium"
        case light = "Inter-Light"
        case extraLight = "Inter-ExtraLight"
        case extraBold = "Inter-ExtraBold"
        case bold = "Inter-Bold"
        case black = "Inter-Black"
    }
    
    public static func registerFonts() {
        Inter.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
        let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
        let font = CGFont(fontDataProvider) else {
            fatalError("Couldn`t create font from filename: \(fontName) wtih extension \(fontExtension)")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
