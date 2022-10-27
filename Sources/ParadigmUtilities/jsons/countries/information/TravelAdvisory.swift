//
//  TravelAdvisory.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct TravelAdvisory : SovereignStateInformationValue {
    public typealias TranslationKeys = SovereignStateInformationValueTranslationKeys
    
    public let id:String
    public var description:String, sources:EventSources?
    
    public init(id: String, description: String, sources: EventSources?) {
        self.id = id
        self.description = description
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: SovereignStateInformationValueTranslationKeys) -> Any? {
        switch key {
        case .description: return description
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: SovereignStateInformationValueTranslationKeys, value: T) {
        switch key {
        case .description:
            description = value as! String
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SovereignStateInformationValueTranslationKeys : String, JsonableTranslationKey {
    case description
    case sources
}
