//
//  HistoricalEvent.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct HistoricalEvent : Jsonable {
    public typealias TranslationKeys = HistoricalEventCodingKeys
    
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
    
    public func getTranslationKeyValue(key: HistoricalEventCodingKeys) -> Any? {
        switch key {
        case .title: return title
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: HistoricalEventCodingKeys, value: T) {
        switch key {
        case .title:
            title = value as? String
            break
        case .sources:
            sources = value as! EventSources
            break
        }
    }
}

public enum HistoricalEventCodingKeys : String, JsonableTranslationKey {
    case title
    case sources
}
