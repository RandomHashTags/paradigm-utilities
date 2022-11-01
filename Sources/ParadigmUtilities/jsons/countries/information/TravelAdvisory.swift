//
//  TravelAdvisory.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct TravelAdvisory : SovereignStateInformationValue {
    public typealias ValueKeys = SovereignStateInformationValueValueKeys
    
    public let id:String
    public var description:String, sources:EventSources?
    
    public init(id: String, description: String, sources: EventSources?) {
        self.id = id
        self.description = description
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateInformationValueValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .description: return description
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateInformationValueValueKeys, value: T) {
        switch key {
        case .description:
            description = value as! String
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SovereignStateInformationValueValueKeys : String, JsonableValueKeys {
    case id
    case description
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .description, .sources:
            return true
        default:
            return false
        }
    }
}
