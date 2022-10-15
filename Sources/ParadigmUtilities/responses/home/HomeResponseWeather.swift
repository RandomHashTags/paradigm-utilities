//
//  HomeResponseWeather.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseWeather : Jsonable {
    public let alerts:WeatherAlertsResponse?, earthquakes:EarthquakesResponse?, natural_events:[PreNaturalEvent]?
    
    public init(alerts: WeatherAlertsResponse?, earthquakes: EarthquakesResponse?, natural_events: [PreNaturalEvent]?) {
        self.alerts = alerts
        self.earthquakes = earthquakes
        self.natural_events = natural_events
    }
}
