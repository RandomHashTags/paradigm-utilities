//
//  NationalAnimals.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnimals : SovereignStateNationalValue {
    public typealias TranslationKeys = NationalAnimalsTranslationKeys
    
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: NationalAnimalsTranslationKeys) -> Any? {
        switch key {
        case .pictures: return pictures
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: NationalAnimalsTranslationKeys, value: T) {
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

public enum NationalAnimalsTranslationKeys : String, JsonableTranslationKey {
    case pictures
    case sources
}
