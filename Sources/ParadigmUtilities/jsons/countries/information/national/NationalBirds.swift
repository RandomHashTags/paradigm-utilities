//
//  NationalBirds.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct NationalBirds : SovereignStateNationalValue {
    public typealias TranslationKeys = NationalBirdsTranslationKeys
    
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalBirdsTranslationKeys) -> Any? {
        switch key {
        case .pictures: return pictures
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NationalBirdsTranslationKeys, value: T) {
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

public enum NationalBirdsTranslationKeys : String, JsonableTranslationKey {
    case pictures
    case sources
}
