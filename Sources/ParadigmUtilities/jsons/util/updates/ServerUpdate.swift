//
//  ServerUpdate.swift
//
//
//  Created by Evan Anderson on 7/28/22.
//

public struct ServerUpdate : Jsonable {    
    public let type:UpdateType
    public var summary:String, related:UpdateRelatedContent?
    public let requires_premium:Bool
    
    public init(type: UpdateType, summary: String, related: UpdateRelatedContent? = nil, requires_premium: Bool = false) {
        self.type = type
        self.summary = summary
        self.related = related
        self.requires_premium = requires_premium
    }
}