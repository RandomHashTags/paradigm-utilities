//
//  ClientWikipediaEvent.swift
//
//
//  Created by RandomHashTags on 6/28/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientWikipediaEvent : Jsonable {
    public typealias TranslationKeys = ClientWikipediaEventTranslationKeys
    
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
    
    public func getTranslationKeyValue(key: ClientWikipediaEventTranslationKeys) -> Any? {
        switch key {
        case .description: return description
        case .hyperlinks: return hyperlinks
        case .tags: return tags
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: ClientWikipediaEventTranslationKeys, value: T) {
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
        }
    }
}

public enum ClientWikipediaEventTranslationKeys : String, JsonableTranslationKey {
    case description
    case hyperlinks
    case tags
    case sources
}
