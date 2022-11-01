//
//  NationalAnthem.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnthem : SovereignStateInformationValue {
    public typealias ValueKeys = NationalAnthemValueKeys
    
    public let mp3URL:String
    public var sources:EventSources?
    
    public init(mp3URL: String, sources: EventSources?) {
        self.mp3URL = mp3URL
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalAnthemValueKeys) -> Any? {
        switch key {
        case .mp3URL: return mp3URL
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NationalAnthemValueKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum NationalAnthemValueKeys : String, JsonableValueKeys {
    case mp3URL
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .sources:
            return true
        default:
            return false
        }
    }
}
