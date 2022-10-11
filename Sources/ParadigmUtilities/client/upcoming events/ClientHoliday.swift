//
//  ClientHoliday.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation

public struct ClientHoliday : Jsonable {
    public let response_version:Int, id:String, name:String, description:String, aliases:[String]?, imageURL:String?, type:String
    public var sources:EventSources?
    
    public init(response_version: Int, id: String, name: String, description: String, aliases: [String]?, imageURL: String?, type: String, sources: EventSources?) {
        self.response_version = response_version
        self.id = id
        self.name = name
        self.description = description
        self.aliases = aliases
        self.imageURL = imageURL
        self.type = type
        self.sources = sources
    }
}
