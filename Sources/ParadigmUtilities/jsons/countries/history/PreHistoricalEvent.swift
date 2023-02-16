//
//  PreHistoricalEvent.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import Foundation

public struct PreHistoricalEvent : Jsonable {
    public typealias ValueKeys = PreHistoricalEventValueKeys
    
    public let id:String, date:EventDate
    public let exact_time_start:Int64?, exact_time_end:Int64?
    public var name:String, summary:String
    public let image_url:String?
    
    public init(id: String, date: EventDate, exact_time_start: Int64?, exact_time_end: Int64?, name: String, summary: String, image_url: String?) {
        self.id = id
        self.date = date
        self.exact_time_start = exact_time_start
        self.exact_time_end = exact_time_end
        self.name = name
        self.summary = summary
        self.image_url = image_url
    }
    
    public func getKeyValue(key: PreHistoricalEventValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .date: return date
        case .exact_time_start: return exact_time_start
        case .exact_time_end: return exact_time_end
        case .name: return name
        case .summary: return summary
        case .image_url: return image_url
        }
    }
    public mutating func setKeyValue<T>(key: PreHistoricalEventValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .summary:
            summary = value as! String
            break
        default:
            break
        }
    }
}

public enum PreHistoricalEventValueKeys : String, JsonableValueKeys {
    case id
    case date
    case exact_time_start
    case exact_time_end
    case name
    case summary
    case image_url
    
    public var is_translatable : Bool {
        switch self {
        case .name, .summary:
            return true
        default:
            return false
        }
    }
}
