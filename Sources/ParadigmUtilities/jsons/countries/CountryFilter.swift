//
//  CountryFilter.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct CountryFilter : Jsonable {    
    public let id:String
    public var title:String
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}