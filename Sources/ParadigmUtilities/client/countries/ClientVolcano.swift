//
//  ClientVolcano.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientVolcano : Jsonable {
    public let id:String, name:String, type:String, summary:String?, imageURL:String?, country:Country, sources:EventSources
    
    public init(id: String, name: String, type: String, summary: String?, imageURL: String?, country: Country, sources: EventSources) {
        self.id = id
        self.name = name
        self.type = type
        self.summary = summary
        self.imageURL = imageURL
        self.country = country
        self.sources = sources
    }
}
