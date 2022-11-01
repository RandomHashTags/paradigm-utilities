//
//  HistoricalEvent.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct HistoricalEvent : Jsonable {
    public typealias ValueKeys = HistoricalEventCodingKeys
    
    public let id:String, date:EventDate
    public var title:String?
    public let imageURL:String?
    public var sources:EventSources
    
    public init(id: String, date: EventDate, title: String?, imageURL: String?, sources: EventSources) {
        self.id = id
        self.date = date
        self.title = title
        self.imageURL = imageURL
        self.sources = sources
    }
    
    public func getKeyValue(key: HistoricalEventCodingKeys) -> Any? {
        switch key {
        case .id: return id
        case .date: return date
        case .title: return title
        case .imageURL: return imageURL
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: HistoricalEventCodingKeys, value: T) {
        switch key {
        case .title:
            title = value as? String
            break
        case .sources:
            sources = value as! EventSources
            break
        default:
            break
        }
    }
}

public enum HistoricalEventCodingKeys : String, JsonableValueKeys {
    case id
    case date
    case title
    case imageURL
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .title, .sources:
            return true
        default:
            return false
        }
    }
}
