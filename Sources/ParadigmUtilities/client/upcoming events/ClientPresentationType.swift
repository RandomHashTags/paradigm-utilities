//
//  ClientPresentationType.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct ClientPresentationType : Jsonable {
    public let id:String, name:String, type:String, aliases:[String]?, defaultImageURL:String?
    
    public init(id: String, name: String, type: String, aliases: [String]?, defaultImageURL: String?) {
        self.id = id
        self.name = name
        self.type = type
        self.aliases = aliases
        self.defaultImageURL = defaultImageURL
    }
}
