//
//  HomeResponseWeather.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public extension HomeResponse {
    struct Weather : HomeResponseProtocol {    
        public var alerts:[CountryWeatherEvents]?
        public var earthquakes:[CountryEarthquakes]?
        public var natural_events:NaturalWeatherEvents?
        
        public init(alerts: [CountryWeatherEvents]?, earthquakes: [CountryEarthquakes]?, natural_events: NaturalWeatherEvents?) {
            self.alerts = alerts
            self.earthquakes = earthquakes
            self.natural_events = natural_events
        }
    }
}