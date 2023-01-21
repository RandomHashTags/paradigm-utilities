//
//  HomeResponseUpcomingEventHolidaysResponse.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct HomeResponseUpcomingEventHolidaysResponse : Jsonable {
    public let date:EventDate
    public let holidays:[PreHoliday]
    
    public init(date: EventDate, holidays: [PreHoliday]) {
        self.date = date
        self.holidays = holidays
    }
}
