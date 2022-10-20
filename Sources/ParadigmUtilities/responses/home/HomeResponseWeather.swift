//
//  HomeResponseWeather.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class HomeResponseWeather : Jsonable {
    public static func == (lhs: HomeResponseWeather, rhs: HomeResponseWeather) -> Bool {
        return lhs.alerts == rhs.alerts && lhs.earthquakes == rhs.earthquakes && lhs.natural_events == rhs.natural_events
    }
    
    public var alerts:[Country:[WeatherEvent]]?
    /// [Country, [SovereignStateSubdivision?, [Magnitude, [PreEarthquake]]]]
    public var earthquakes:[Country?:[String:[String:[PreEarthquake]]]]?
    public var natural_events:NaturalWeatherEventsResponse?
    
    public init(alerts: [Country:[WeatherEvent]]?, earthquakes: [Country:[String:[String:[PreEarthquake]]]]?, natural_events: NaturalWeatherEventsResponse?) {
        self.alerts = alerts
        self.earthquakes = earthquakes
        self.natural_events = natural_events
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(alerts)
        hasher.combine(earthquakes)
        hasher.combine(natural_events)
    }
}
