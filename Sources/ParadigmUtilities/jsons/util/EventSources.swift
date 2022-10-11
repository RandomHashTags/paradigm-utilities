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
    
    init(sources: [EventSource] = [EventSource]()) {
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
    
    var isEmpty : Bool {
        return sources.isEmpty
    }
    
    mutating func append(_ source: EventSource) {
        sources.append(source)
    }
    mutating func append(_ sources: EventSources?) {
        guard let sources:[EventSource] = sources?.sources else { return }
        self.sources.append(contentsOf: sources)
    }
    mutating func append(contentsOf: [EventSource]) {
        sources.append(contentsOf: contentsOf)
    }
}
