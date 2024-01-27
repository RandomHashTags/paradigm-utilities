//
//  SovereignStateSingleValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateSingleValue : SovereignStateIdentifiableValue {
    public typealias JSONKeys = SovereignStateSingleValueValueKeys
    
    public let info:SovereignStateInfo
    public var notes:String?, value:String, value_description:String?
    public let year_of_data:Int
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, value: String, value_description: String?, year_of_data: Int, sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.value = value
        self.value_description = value_description
        self.year_of_data = year_of_data
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateSingleValueValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .notes: return notes
        case .value: return value
        case .value_description: return value_description
        case .year_of_data: return year_of_data
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateSingleValueValueKeys, value: T) {
        switch key {
        case .notes:
            notes = value as? String
            break
        case .value:
            self.value = value as! String
            break
        case .value_description:
            value_description = value as? String
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SovereignStateSingleValueValueKeys : String, JsonableKeys {
    case info
    case notes
    case value
    case value_description
    case year_of_data
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .notes, .value, .value_description, .sources:
            return true
        default:
            return false
        }
    }
}
