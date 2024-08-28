//
//  NationalAnthem.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnthem : SovereignStateInformationValue {
    public typealias JSONKeys = NationalAnthemValueKeys
    
    public let mp3_url:String
    public var sources:EventSources?
    
    public init(mp3_url: String, sources: EventSources?) {
        self.mp3_url = mp3_url
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalAnthemValueKeys) -> Any? {
        switch key {
        case .mp3_url: return mp3_url
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

public enum NationalAnthemValueKeys : String, JsonableKeys {
    case mp3_url
    case sources
}
