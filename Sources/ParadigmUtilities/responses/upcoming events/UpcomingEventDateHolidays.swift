//
//  UpcomingEventDateHolidays.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct UpcomingEventDateHolidays : Jsonable { // TODO: REMOVE??    
    public let date:EventDate
    public var holidays:[PreHoliday]
    
    public init(date: EventDate, holidays: [PreHoliday]) {
        self.date = date
        self.holidays = holidays
    }
}