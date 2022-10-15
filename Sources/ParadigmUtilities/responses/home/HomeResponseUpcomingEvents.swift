//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseUpcomingEvents : Jsonable {
    public let holidays_near:[PreHoliday], events:[PreUpcomingEvent]
    
    public init(holidays_near: [PreHoliday], events: [PreUpcomingEvent]) {
        self.holidays_near = holidays_near
        self.events = events
    }
}
