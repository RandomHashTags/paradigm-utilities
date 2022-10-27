//
//  WikipediaPicture.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct WikipediaPicture : Jsonable {
    public typealias TranslationKeys = WikipediaPictureTranslationKeys
    
    public let key:String
    public var name:String, title:String?
    public let imageURL:String
    
    public init(key: String, name: String, title: String?, imageURL: String) {
        self.key = key
        self.name = name
        self.title = title
        self.imageURL = imageURL
    }
    
    public func getTag() -> String {
        return title ?? name
    }
    
    public func getTranslationKeyValue(key: WikipediaPictureTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .title: return title
        }
    }
    public mutating func setTranslationKeyValue<T>(key: WikipediaPictureTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .title:
            title = value as? String
            break
        }
    }
}

public enum WikipediaPictureTranslationKeys : String, JsonableTranslationKey {
    case name
    case title
}
