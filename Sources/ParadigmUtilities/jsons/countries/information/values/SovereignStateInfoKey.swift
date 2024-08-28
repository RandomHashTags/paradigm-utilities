//
//  SovereignStateInfoKey.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoKey : SovereignStateInformationValue {
    public typealias JSONKeys = SovereignStateInfoKeyValueKeys
    
    public let info:SovereignStateInfo
    public var notes:String?
    public var year_of_data:Int
    public var values:[SovereignStateInfoValue], sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, year_of_data: Int, values: [SovereignStateInfoValue?], sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.year_of_data = year_of_data
        self.values = values.compactMap({ $0 })
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateInfoKeyValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .notes: return notes
        case .year_of_data: return year_of_data
        case .values: return values
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateInfoKeyValueKeys, value: T) {
        switch key {
        case .notes:
            notes = value as? String
            break
        case .values:
            values = value as! [SovereignStateInfoValue]
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SovereignStateInfoKeyValueKeys : String, JsonableKeys {
    case info
    case notes
    case year_of_data
    case values
    case sources
}
