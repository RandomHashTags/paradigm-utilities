//
//  NationalAnimals.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnimals : SovereignStateNationalValue {
    public typealias ValueKeys = NationalAnimalsValueKeys
    
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalAnimalsValueKeys) -> Any? {
        switch key {
        case .pictures: return pictures
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NationalAnimalsValueKeys, value: T) {
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

public enum NationalAnimalsValueKeys : String, JsonableValueKeys {
    case pictures
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .pictures, .sources:
            return true
        }
    }
}
