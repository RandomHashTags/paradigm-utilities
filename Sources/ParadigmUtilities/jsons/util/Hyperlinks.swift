//
//  Hyperlinks.swift
//
//
//  Created by Evan Anderson on 7/25/22.
//

private enum CodingKeys: CodingKey {
    case image_url_prefix
    case hyperlinks
}
public struct Hyperlinks : Sequence, IteratorProtocol, Jsonable {    
    public let image_url_prefix:String
    
    private var hyperlinks:[Hyperlink], hyperlink_count:Int = -1
    
    public init(image_url_prefix: String, hyperlinks: [Hyperlink] = []) {
        self.image_url_prefix = image_url_prefix
        self.hyperlinks = hyperlinks
    }
    
    public var count : Int { hyperlinks.count }
    public var isEmpty : Bool { hyperlinks.isEmpty }
    
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
        let next:Int = hyperlink_count + 1
        guard next < hyperlinks.count else { return nil }
        hyperlink_count = next
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
}