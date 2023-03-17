//
//  Hyperlinks.swift
//
//
//  Created by Evan Anderson on 7/25/22.
//

import Foundation

private enum CodingKeys: CodingKey {
    case image_url_prefix
    case hyperlinks
}
public struct Hyperlinks : Sequence, IteratorProtocol, Jsonable {
    public typealias ValueKeys = HyperlinksValueKeys
    
    public let image_url_prefix:String
    
    private var hyperlinks:[Hyperlink], hyperlink_count:Int = -1
    
    public init(image_url_prefix: String, hyperlinks: [Hyperlink] = [Hyperlink]()) {
        self.image_url_prefix = image_url_prefix
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
        try container.encode(self.image_url_prefix, forKey: .image_url_prefix)
        try container.encode(self.hyperlinks, forKey: .hyperlinks)
    }
    
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.image_url_prefix = try container.decode(String.self, forKey: .image_url_prefix)
        self.hyperlinks = try container.decode([Hyperlink].self, forKey: .hyperlinks)
    }
    
    public mutating func next() -> Hyperlink? {
        let nextNumber:Int = hyperlink_count + 1
        guard nextNumber < hyperlinks.count else { return nil }
        hyperlink_count = nextNumber
        return hyperlinks[hyperlink_count]
    }
    public mutating func append(_ hyperlink: Hyperlink) {
        hyperlinks.append(hyperlink)
    }
    public mutating func append(contentsOf newElements: [Hyperlink]) {
        hyperlinks.append(contentsOf: newElements)
    }
    public mutating func remove(_ hyperlink: Hyperlink) {
        guard let index:Int = hyperlinks.firstIndex(of: hyperlink) else { return }
        hyperlinks.remove(at: index)
        hyperlink_count -= 1
    }
    
    public func getKeyValue(key: HyperlinksValueKeys) -> Any? {
        switch key {
        case .hyperlinks: return hyperlinks
        }
    }
    public mutating func setKeyValue<T>(key: HyperlinksValueKeys, value: T) {
        switch key {
        case .hyperlinks:
            hyperlinks = value as! [Hyperlink]
            break
        }
    }
}

public enum HyperlinksValueKeys : String, JsonableValueKeys {
    case hyperlinks
    
    public var is_translatable : Bool {
        switch self {
        case .hyperlinks:
            return true
        }
    }
}
