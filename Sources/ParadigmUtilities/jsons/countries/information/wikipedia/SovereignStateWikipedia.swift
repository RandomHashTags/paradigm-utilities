//
//  SovereignStateWikipedia.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateWikipedia : SovereignStateInformationValue {
    public typealias TranslationKeys = SovereignStateWikipediaTranslationKeys
    
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
    
    public func getKeyValue(key: SovereignStateWikipediaTranslationKeys) -> Any? {
        switch key {
        case .paragraph: return paragraph
        case .statistics: return statistics
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateWikipediaTranslationKeys, value: T) {
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
        }
    }
}

public enum SovereignStateWikipediaTranslationKeys : String, JsonableTranslationKey {
    case paragraph
    case statistics
    case sources
}
