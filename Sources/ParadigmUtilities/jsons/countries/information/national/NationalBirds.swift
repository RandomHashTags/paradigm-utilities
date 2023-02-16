//
//  NationalBirds.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct NationalBirds : SovereignStateNationalValue {
    public typealias ValueKeys = NationalBirdsValueKeys
    
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalBirdsValueKeys) -> Any? {
        switch key {
        case .pictures: return pictures
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NationalBirdsValueKeys, value: T) {
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

public enum NationalBirdsValueKeys : String, JsonableValueKeys {
    case pictures
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .pictures, .sources:
            return true
        }
    }
}
