//
//  MovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct MovieProductionCompany : Jsonable {
    public let id:String, name:String, aliases:[String]?, description:String, imageURL:String?, sources:EventSources
    
    public init(id: String, name: String, aliases: [String]?, description: String, imageURL: String?, sources: EventSources) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.description = description
        self.imageURL = imageURL
        self.sources = sources
    }
}
