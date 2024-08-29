//
//  PreMovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct PreMovieProductionCompany : MovieProductionCompanyProtocol {    
    public let id:String
    public var name:String, aliases:[String]?
    public var image_url:String?
    
    public init(id: String, name: String, aliases: [String]?, image_url: String?) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.image_url = image_url
    }
}