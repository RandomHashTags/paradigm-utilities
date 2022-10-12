//
//  WikipediaPicture.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct WikipediaPicture : Jsonable {
    public let name:String, title:String?, imageURL:String
    
    public init(name: String, title: String?, imageURL: String) {
        self.name = name
        self.title = title
        self.imageURL = imageURL
    }
}
