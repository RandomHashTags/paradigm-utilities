//
//  NationalCapital.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalCapital : SovereignStateInformationValue {
    public typealias ValueKeys = NationalCapitalValueKeys
    
    public let place:String
    public var notes:String?, sources:EventSources?
    
    public init(place: String, notes: String?, sources: EventSources?) {
        self.place = place
        self.notes = notes
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalCapitalValueKeys) -> Any? {
        switch key {
        case .place: return place
        case .notes: return notes
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NationalCapitalValueKeys, value: T) {
        switch key {
        case .notes:
            notes = value as? String
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum NationalCapitalValueKeys : String, JsonableValueKeys {
    case place
    case notes
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .notes, .sources:
            return true
        default:
            return false
        }
    }
}
