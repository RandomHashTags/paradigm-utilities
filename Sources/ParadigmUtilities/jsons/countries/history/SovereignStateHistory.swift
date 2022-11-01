//
//  SovereignStateHistory.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateHistory : SovereignStateInformationValue {
    public typealias ValueKeys = SovereignStateHistoryValueKeys
    
    public var summaryEvents:[HistoricalEvent], sources:EventSources?
    
    public init(summaryEvents: [HistoricalEvent], sources: EventSources?) {
        self.summaryEvents = summaryEvents
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateHistoryValueKeys) -> Any? {
        switch key {
        case .summaryEvents: return summaryEvents
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateHistoryValueKeys, value: T) {
        switch key {
        case .summaryEvents:
            summaryEvents = value as! [HistoricalEvent]
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SovereignStateHistoryValueKeys : String, JsonableValueKeys {
    case summaryEvents
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .summaryEvents, .sources:
            return true
        }
    }
}
