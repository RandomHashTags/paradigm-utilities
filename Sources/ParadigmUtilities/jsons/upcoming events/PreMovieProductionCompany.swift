//
//  PreMovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct PreMovieProductionCompany : Jsonable {
    public let id:String, name:String, aliases:[String]?, imageURL:String?
    
    public init(id: String, name: String, aliases: [String]?, imageURL: String?) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.imageURL = imageURL
    }
}
