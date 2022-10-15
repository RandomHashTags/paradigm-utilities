//
//  CountryFilter.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct CountryFilter : Jsonable {
    public let id:String, title:String
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}
