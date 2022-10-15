//
//  HomeResponseWeather.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseWeather : Jsonable {
    public let alerts:WeatherAlertsResponse?, earthquakes:EarthquakesResponse?
    
    public init(alerts: WeatherAlertsResponse?, earthquakes: EarthquakesResponse?) {
        self.alerts = alerts
        self.earthquakes = earthquakes
    }
}
