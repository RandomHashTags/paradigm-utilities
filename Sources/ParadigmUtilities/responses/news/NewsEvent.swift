//
//  NewsEvent.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import Foundation
import SwiftSovereignStates

public struct NewsEvent : Jsonable {
    public typealias ValueKeys = NewsEventValueKeys
    
    public let id:String
    public var name:String?, description:String?
    public let image_url:String?, video_url:String?
    public var sources:EventSources
    
    public let related_countries:[Country]?
    public let related_subdivisions:[SovereignStateSubdivisionWrapper]?
    public let related_cities:[SovereignStateCityWrapper]?
    
    public init(id: String, name: String?, description: String?, image_url: String?, video_url: String?, sources: EventSources, related_countries: [Country]?, related_subdivisions: [SovereignStateSubdivisionWrapper]?, related_cities: [SovereignStateCityWrapper]?) {
        self.id = id
        self.name = name
        self.description = description
        self.image_url = image_url
        self.video_url = video_url
        self.sources = sources
        self.related_countries = related_countries
        self.related_subdivisions = related_subdivisions
        self.related_cities = related_cities
    }
    
    public func getKeyValue(key: NewsEventValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .description: return description
        case .image_url: return image_url
        case .video_url: return video_url
        case .sources: return sources
            
        case .related_countries: return related_countries
        case .related_subdivisions: return related_subdivisions
        case .related_cities: return related_cities
        }
    }
    public mutating func setKeyValue<T>(key: NewsEventValueKeys, value: T) {
        switch key {
        case .name:
            name = value as? String
            break
        case .description:
            description = value as? String
            break
        case .sources:
            sources = value as! EventSources
            break
        default:
            break
        }
    }
}

public enum NewsEventValueKeys : String, JsonableValueKeys {
    case id
    case name
    case description
    case image_url
    case video_url
    case sources
    
    case related_countries
    case related_subdivisions
    case related_cities
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .description, .sources:
            return true
        default:
            return false
        }
    }
}
