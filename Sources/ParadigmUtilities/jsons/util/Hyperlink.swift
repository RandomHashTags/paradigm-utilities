//
//  Hyperlink.swift
//
//
//  Created by Evan Anderson on 7/25/22.
//

import Foundation

public struct Hyperlink : Jsonable {
    public typealias TranslationKeys = HyperlinkTranslationKeys
    
    public var text:String
    public var url:String
    
    public init(text: String, url: String) {
        self.text = text
        self.url = url
    }
    
    public func getKeyValue(key: HyperlinkTranslationKeys) -> Any? {
        switch key {
        case .text: return text
        }
    }
    public mutating func setKeyValue<T>(key: HyperlinkTranslationKeys, value: T) {
        switch key {
        case .text:
            text = value as! String
            break
        }
    }
}

public enum HyperlinkTranslationKeys : String, JsonableTranslationKey {
    case text
}
