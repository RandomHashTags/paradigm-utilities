//
//  EventSources.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

import Foundation

public struct EventSources : Jsonable {
    enum CodingKeys: CodingKey {
        case sources
    }
    
    private var sources:[EventSource]
    
    public init(sources: [EventSource] = [EventSource]()) {
        self.sources = sources
    }
    
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        self.sources = try container.decode([EventSource].self)
    }
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(self.sources)
    }
    
    public var isEmpty : Bool {
        return sources.isEmpty
    }
    
    
    public mutating func append(_ source: EventSource) {
        sources.append(source)
    }
    public mutating func append(_ sources: EventSources?) {
        guard let sources:[EventSource] = sources?.sources else { return }
        self.sources.append(contentsOf: sources)
    }
    public mutating func append(contentsOf: [EventSource]) {
        sources.append(contentsOf: contentsOf)
    }
    
    public mutating func sorted(by: (EventSource, EventSource) -> Bool) {
        sources = sources.sorted(by: by)
    }
    
    public func getWikipediaSource() -> EventSource? {
        return sources.first(where: { $0.siteName.lowercased().starts(with: "wikipedia: ") })
    }
}
