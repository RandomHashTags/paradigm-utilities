//
//  PreHoliday.swift
//
//
//  Created by Evan Anderson on 6/17/22.
//

import Foundation
import SwiftSovereignStates

public struct PreHoliday {
    public let date:EventDate, id:String, name:String, type:String, emoji:String?, celebrators:String?
    public var countries:[Country]?
    
    public init(date: EventDate, id: String, name: String, type: String, emoji: String?, celebrators: String?, countries: [Country]? = nil) {
        self.date = date
        self.id = id
        self.name = name
        self.type = type
        self.emoji = emoji
        self.celebrators = celebrators
        self.countries = countries
    }
    
    public mutating func addCountry(country: Country) {
        if countries == nil {
            countries = [Country]()
        }
        countries?.append(country)
    }
}
