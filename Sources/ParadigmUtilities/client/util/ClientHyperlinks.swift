//
//  Hyperlinks.swift
//
//
//  Created by Evan Anderson on 7/25/22.
//

import Foundation

private enum CodingKeys: CodingKey {
    case imageURLPrefix
    case hyperlinks
}
public struct ClientHyperlinks : Sequence, IteratorProtocol, Jsonable {
    public let imageURLPrefix:String
    
    private var hyperlinks:[Hyperlink], hyperlinkCount:Int = -1
    
    public init(imageURLPrefix: String, hyperlinks: [Hyperlink] = [Hyperlink]()) {
        self.imageURLPrefix = imageURLPrefix
        self.hyperlinks = hyperlinks
    }
    
    public var count : Int {
        return hyperlinks.count
    }
    public var isEmpty : Bool {
        return hyperlinks.isEmpty
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:KeyedEncodingContainer = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.imageURLPrefix, forKey: .imageURLPrefix)
        try container.encode(self.hyperlinks, forKey: .hyperlinks)
    }
    
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.imageURLPrefix = try container.decode(String.self, forKey: .imageURLPrefix)
        self.hyperlinks = try container.decode([Hyperlink].self, forKey: .hyperlinks)
    }
    
    public mutating func next() -> Hyperlink? {
        let nextNumber:Int = hyperlinkCount + 1
        guard nextNumber < hyperlinks.count else { return nil }
        hyperlinkCount = nextNumber
        return hyperlinks[hyperlinkCount]
    }
    public mutating func append(_ hyperlink: Hyperlink) {
        hyperlinks.append(hyperlink)
    }
    public mutating func append(contentsOf newElements: [Hyperlink]) {
        hyperlinks.append(contentsOf: newElements)
    }
}