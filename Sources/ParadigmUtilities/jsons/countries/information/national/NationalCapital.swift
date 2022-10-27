//
//  NationalCapital.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalCapital : SovereignStateInformationValue {
    public typealias TranslationKeys = NationalCapitalTranslationKeys
    
    public let place:String
    public var notes:String?, sources:EventSources?
    
    public init(place: String, notes: String?, sources: EventSources?) {
        self.place = place
        self.notes = notes
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalCapitalTranslationKeys) -> Any? {
        switch key {
        case .notes: return notes
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NationalCapitalTranslationKeys, value: T) {
        switch key {
        case .notes:
            notes = value as? String
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum NationalCapitalTranslationKeys : String, JsonableTranslationKey {
    case notes
    case sources
}
