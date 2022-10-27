//
//  NationalAnthem.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnthem : SovereignStateInformationValue {
    public typealias TranslationKeys = NationalAnthemTranslationKeys
    
    public let mp3URL:String
    public var sources:EventSources?
    
    public init(mp3URL: String, sources: EventSources?) {
        self.mp3URL = mp3URL
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: NationalAnthemTranslationKeys) -> Any? {
        switch key {
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: NationalAnthemTranslationKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum NationalAnthemTranslationKeys : String, JsonableTranslationKey {
    case sources
}
