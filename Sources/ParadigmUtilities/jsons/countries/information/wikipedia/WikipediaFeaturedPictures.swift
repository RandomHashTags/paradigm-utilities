//
//  WikipediaFeaturedPictures.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct WikipediaFeaturedPictures : SovereignStateInformationValue {
    public typealias TranslationKeys = WikipediaFeaturedPicturesTranslationKeys
    
    public let imageURLPrefix:String
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(imageURLPrefix: String, pictures: [WikipediaPicture], sources: EventSources?) {
        self.imageURLPrefix = imageURLPrefix
        self.pictures = pictures
        self.sources = sources
    }
    
    public func getKeyValue(key: WikipediaFeaturedPicturesTranslationKeys) -> Any? {
        switch key {
        case .pictures: return pictures
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: WikipediaFeaturedPicturesTranslationKeys, value: T) {
        switch key {
        case .pictures:
            pictures = value as! [WikipediaPicture]
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum WikipediaFeaturedPicturesTranslationKeys : String, JsonableTranslationKey {
    case pictures
    case sources
}
