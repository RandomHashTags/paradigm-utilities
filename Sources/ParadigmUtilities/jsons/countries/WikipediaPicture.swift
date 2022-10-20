//
//  WikipediaPicture.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct WikipediaPicture : Jsonable {
    public let key:String, name:String, title:String?, imageURL:String
    
    public init(key: String, name: String, title: String?, imageURL: String) {
        self.key = key
        self.name = name
        self.title = title
        self.imageURL = imageURL
    }
    
    public func getTag() -> String {
        return title ?? name
    }
}
