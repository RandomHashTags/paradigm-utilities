//
//  PreHoliday.swift
//
//
//  Created by Evan Anderson on 6/17/22.
//

import Foundation
import SwiftSovereignStates

public struct PreHoliday {
    let date:EventDate, id:String, name:String, type:String, emoji:String?, celebrators:String?
    var countries:[Country]?
    
    mutating func addCountry(country: Country) {
        if countries == nil {
            countries = [Country]()
        }
        countries?.append(country)
    }
}
