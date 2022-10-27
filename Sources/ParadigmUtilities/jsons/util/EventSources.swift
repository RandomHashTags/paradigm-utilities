//
//  EventSources.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

import Foundation

public final class EventSources : Jsonable {
    public static func == (lhs: EventSources, rhs: EventSources) -> Bool {
        return lhs.sources.elementsEqual(rhs.sources)
    }
    
    public typealias TranslationKeys = EventSourcesTranslationKeys
    
    private var sources:[EventSource]
    
    public init(sources: [EventSource] = [EventSource]()) {
        self.sources = sources
    }
    
    public subscript(index: Int) -> EventSource? {
        return sources.count > index ? sources[index] : nil
    }
    
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        self.sources = try container.decode([EventSource].self)
    }
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(self.sources)
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(sources)
    }
    
    public var count : Int {
        return sources.count
    }
    public var isEmpty : Bool {
        return sources.isEmpty
    }
    public var first : EventSource? {
        return sources.first
    }
    
    public func append(_ source: EventSource) {
        sources.append(source)
    }
    public func append(_ sources: EventSources?) {
        guard let sources:[EventSource] = sources?.sources else { return }
        self.sources.append(contentsOf: sources)
    }
    public func append(contentsOf: [EventSource]) {
        sources.append(contentsOf: contentsOf)
    }
    
    public func sorted(by: (EventSource, EventSource) -> Bool) {
        sources = sources.sorted(by: by)
    }
    public func setSources(_ sources: EventSources) {
        self.sources = sources.sources
    }
    public func setSources(_ sources: [EventSource]) {
        self.sources = sources
    }
    
    public func getWikipediaSource() -> EventSource? {
        return sources.first(where: { $0.siteName.lowercased().starts(with: "wikipedia: ") })
    }
    
    public func setKeyValue<T>(key: EventSourcesTranslationKeys, value: T) {
        switch key {
        case .sources:
            sources = value as! [EventSource]
            break
        }
    }
}

public enum EventSourcesTranslationKeys : String, JsonableTranslationKey {
    case sources
}
