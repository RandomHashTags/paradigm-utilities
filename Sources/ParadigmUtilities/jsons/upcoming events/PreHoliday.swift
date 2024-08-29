//
//  PreHoliday.swift
//
//
//  Created by Evan Anderson on 6/17/22.
//

import SwiftSovereignStates

public struct PreHoliday : Jsonable {    
    public let type:String, id:String
    public var name:String
    public let emoji:String?
    public var countries:[Country]?
    
    public init(type: String, id: String, name: String, emoji: String?, countries: [Country]? = nil) {
        self.type = type
        self.id = id
        self.name = name
        self.emoji = emoji
        self.countries = countries
    }
    
    public mutating func addCountry(country: Country) {
        if countries == nil {
            countries = []
        }
        countries?.append(country)
    }
}