//
//  HistoricalEvent.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation
import SwiftSovereignStates

public struct HistoricalEvent : Jsonable {
    public typealias JSONKeys = HistoricalEventValueKeys
    
    public let id:String, date:EventDate
    public let exact_time_start:Int64?, exact_time_end:Int64?
    public var name:String, description:String
    public let image_urls:[String]?, video_urls:[String]?
    public let country:Country?, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?
    public var sources:EventSources
    
    public init(id: String, date: EventDate, exact_time_start: Int64?, exact_time_end: Int64?, name: String, description: String, image_urls: [String]?, video_urls: [String]?, country: Country?, subdivision: SovereignStateSubdivisionWrapper?, city: SovereignStateCityWrapper?, sources: EventSources) {
        self.id = id
        self.date = date
        self.exact_time_start = exact_time_start
        self.exact_time_end = exact_time_end
        self.name = name
        self.description = description
        self.image_urls = image_urls
        self.video_urls = video_urls
        self.country = country
        self.subdivision = subdivision
        self.city = city
        self.sources = sources
    }
    
    public func getKeyValue(key: HistoricalEventValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .date: return date
        case .exact_time_start: return exact_time_start
        case .exact_time_end: return exact_time_end
        case .name: return name
        case .description: return description
        case .image_urls: return image_urls
        case .video_urls: return video_urls
        case .country: return country
        case .subdivision: return subdivision
        case .city: return city
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: HistoricalEventValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .description:
            description = value as! String
            break
        case .sources:
            sources = value as! EventSources
            break
        default:
            break
        }
    }
}

public enum HistoricalEventValueKeys : String, JsonableKeys {
    case id
    case date
    case exact_time_start
    case exact_time_end
    case name
    case description
    case image_urls
    case video_urls
    case country
    case subdivision
    case city
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .name, .description, .sources:
            return true
        default:
            return false
        }
    }
}
