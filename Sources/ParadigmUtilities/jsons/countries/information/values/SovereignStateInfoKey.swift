//
//  SovereignStateInfoKey.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoKey : SovereignStateInformationValue {
    public typealias ValueKeys = SovereignStateInfoKeyValueKeys
    
    public let info:SovereignStateInfo
    public var notes:String?
    public var yearOfData:Int
    public var values:[SovereignStateInfoValue], sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, yearOfData: Int, values: [SovereignStateInfoValue?], sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.yearOfData = yearOfData
        self.values = values.compactMap({ $0 })
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateInfoKeyValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .notes: return notes
        case .yearOfData: return yearOfData
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

public enum SovereignStateInfoKeyValueKeys : String, JsonableValueKeys {
    case info
    case notes
    case yearOfData
    case values
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .notes, .values, .sources:
            return true
        default:
            return false
        }
    }
}
