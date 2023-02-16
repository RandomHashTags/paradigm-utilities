//
//  SovereignStateHistory.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateHistory : SovereignStateInformationValue {
    public typealias ValueKeys = SovereignStateHistoryValueKeys
    
    public var events:[PreHistoricalEvent], sources:EventSources?
    
    public init(events: [PreHistoricalEvent], sources: EventSources?) {
        self.events = events
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateHistoryValueKeys) -> Any? {
        switch key {
        case .events: return events
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateHistoryValueKeys, value: T) {
        switch key {
        case .events:
            events = value as! [PreHistoricalEvent]
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SovereignStateHistoryValueKeys : String, JsonableValueKeys {
    case events
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .events, .sources:
            return true
        }
    }
}
