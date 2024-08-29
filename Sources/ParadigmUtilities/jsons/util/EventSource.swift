//
//  EventSource.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

public struct EventSource : Jsonable {    
    public var name:String
    public let url:String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}