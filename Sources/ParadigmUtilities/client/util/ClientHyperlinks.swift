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
    let imageURLPrefix:String
    
    private var hyperlinks:[Hyperlink], hyperlinkCount:Int = -1
    
    var count : Int {
        return hyperlinks.count
    }
    var isEmpty : Bool {
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
    
    mutating public func next() -> Hyperlink? {
        let nextNumber:Int = hyperlinkCount + 1
        guard nextNumber < hyperlinks.count else { return nil }
        hyperlinkCount = nextNumber
        return hyperlinks[hyperlinkCount]
    }
}
