//
//  WikipediaPicture.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct WikipediaPicture : Jsonable {    
    public let key:String
    public var name:String, title:String?
    public let image_url:String
    
    public init(key: String, name: String, title: String?, image_url: String) {
        self.key = key
        self.name = name
        self.title = title
        self.image_url = image_url
    }
    
    public var tag : String {
        return title ?? name
    }
}
