//
//  EventSources.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

import Foundation

public struct EventSources : Jsonable {
    public static func == (lhs: EventSources, rhs: EventSources) -> Bool {
        return lhs.sources.elementsEqual(rhs.sources)
    }
    
    public typealias ValueKeys = EventSourcesValueKeys
    
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
    
    public mutating func append(_ source: EventSource) {
        sources.append(source)
    }
    public mutating func append(_ sources: EventSources?) {
        guard let sources:[EventSource] = sources?.sources else { return }
        self.sources.append(contentsOf: sources)
    }
    public mutating func append(_ sources: EventSources) {
        self.sources.append(contentsOf: sources.sources)
    }
    public mutating func append(contentsOf: [EventSource]) {
        sources.append(contentsOf: contentsOf)
    }
    
    public mutating func sorted(by: (EventSource, EventSource) -> Bool) {
        sources = sources.sorted(by: by)
    }
    public mutating func setSources(_ sources: EventSources) {
        self.sources = sources.sources
    }
    public mutating func setSources(_ sources: [EventSource]) {
        self.sources = sources
    }
    
    public var wikipedia_source : EventSource? {
        return sources.first(where: { $0.name.lowercased().starts(with: "wikipedia: ") })
    }
    
    public func getKeyValue(key: EventSourcesValueKeys) -> Any? {
        switch key {
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: EventSourcesValueKeys, value: T) {
        switch key {
        case .sources:
            sources = value as! [EventSource]
            break
        }
    }
}

public enum EventSourcesValueKeys : String, JsonableValueKeys {
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .sources:
            return true
        }
    }
}
