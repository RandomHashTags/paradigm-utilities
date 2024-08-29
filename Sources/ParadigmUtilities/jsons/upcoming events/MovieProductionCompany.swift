//
//  MovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct MovieProductionCompany : MovieProductionCompanyProtocol {    
    public let response_version:Int, id:String
    public var name:String, aliases:[String]?, description:String
    public let image_url:String?
    public var sources:EventSources
    
    public init(response_version: Int, id: String, name: String, aliases: [String]?, description: String, image_url: String?, sources: EventSources) {
        self.response_version = response_version
        self.id = id
        self.name = name
        self.aliases = aliases
        self.description = description
        self.image_url = image_url
        self.sources = sources
    }
    
    public func toPreMovieProductionCompany() -> PreMovieProductionCompany {
        return PreMovieProductionCompany(id: id, name: name, aliases: aliases, image_url: image_url)
    }
}