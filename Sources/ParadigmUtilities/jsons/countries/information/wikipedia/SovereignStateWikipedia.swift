//
//  SovereignStateWikipedia.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateWikipedia : SovereignStateInformationValue {
    public typealias ValueKeys = SovereignStateWikipediaValueKeys
    
    public var paragraph:String
    public let url:String
    public var statistics:WikipediaStatistics?
    public var sources:EventSources?
    
    public init(paragraph: String, url: String, statistics: WikipediaStatistics?, sources: EventSources?) {
        self.paragraph = paragraph
        self.url = url
        self.statistics = statistics
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateWikipediaValueKeys) -> Any? {
        switch key {
        case .paragraph: return paragraph
        case .url: return url
        case .statistics: return statistics
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateWikipediaValueKeys, value: T) {
        switch key {
        case .paragraph:
            paragraph = value as! String
            break
        case .statistics:
            statistics = value as? WikipediaStatistics
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SovereignStateWikipediaValueKeys : String, JsonableValueKeys {
    case paragraph
    case url
    case statistics
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .paragraph, .statistics, .sources:
            return true
        default:
            return false
        }
    }
}
