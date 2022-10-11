//
//  ServerUpdate.swift
//
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation

public struct ServerUpdate : Jsonable {
    let type:UpdateType, summary:String, related:UpdateRelatedContent?, requiresPremium:Bool?
    
    init(type: UpdateType, summary: String, related: UpdateRelatedContent? = nil, requiresPremium: Bool = false) {
        self.type = type
        self.summary = summary
        self.related = related
        self.requiresPremium = requiresPremium ? true : nil
    }
}
