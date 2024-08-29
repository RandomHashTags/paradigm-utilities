//
//  PreElection.swift
//  
//
//  Created by Evan Anderson on 10/31/22.
//

import SwiftSovereignStates

public struct PreElection : Jsonable {    
    public let id:String
    public var name:String
    public let date:EventDate, country:Country
    
    public init(id: String, name: String, date: EventDate, country: Country) {
        self.id = id
        self.name = name
        self.date = date
        self.country = country
    }
}