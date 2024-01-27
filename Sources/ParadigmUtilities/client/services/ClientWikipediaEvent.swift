//
//  ClientWikipediaEvent.swift
//
//
//  Created by RandomHashTags on 6/28/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientWikipediaEvent : Jsonable {
    public typealias JSONKeys = ClientWikipediaEventValueKeys
    
    public let images:[String]?
    public var description:String, hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public var tags:[String]?, sources:EventSources?
    
    public init(images: [String]?, description: String, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [SovereignStateSubdivisionWrapper]?, tags: [String]?, sources: EventSources?) {
        self.images = images
        self.description = description
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions
        self.tags = tags
        self.sources = sources
    }
    
    public func getKeyValue(key: ClientWikipediaEventValueKeys) -> Any? {
        switch key {
        case .images: return images
        case .description: return description
        case .hyperlinks: return hyperlinks
        case .countries: return countries
        case .subdivisions: return subdivisions
        case .tags: return tags
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: ClientWikipediaEventValueKeys, value: T) {
        switch key {
        case .description:
            description = value as! String
            break
        case .hyperlinks:
            hyperlinks = value as? Hyperlinks
            break
        case .tags:
            tags = value as? [String]
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum ClientWikipediaEventValueKeys : String, JsonableKeys {
    case images
    case description
    case hyperlinks
    case countries
    case subdivisions
    case tags
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .description, .hyperlinks, .tags, .sources:
            return true
        default:
            return false
        }
    }
}
