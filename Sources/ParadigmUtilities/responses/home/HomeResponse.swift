//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponse : Jsonable {
    public static func == (lhs: HomeResponse, rhs: HomeResponse) -> Bool {
        return lhs.countries == rhs.countries && lhs.government == rhs.government && lhs.stock_market == rhs.stock_market && lhs.upcoming_events == rhs.upcoming_events && lhs.weather == rhs.weather
    }
    
    public static var LATEST:HomeResponse! = nil
    
    public var countries:HomeResponseCountries?, government:HomeResponseGovernment?, stock_market:HomeResponseStockMarket?, upcoming_events:HomeResponseUpcomingEvents?, weather:HomeResponseWeather?
    
    public init(countries: HomeResponseCountries?, government: HomeResponseGovernment?, stock_market: HomeResponseStockMarket?, upcoming_events: HomeResponseUpcomingEvents?, weather: HomeResponseWeather?) {
        self.countries = countries
        self.government = government
        self.stock_market = stock_market
        self.upcoming_events = upcoming_events
        self.weather = weather
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(countries)
        hasher.combine(government)
        hasher.combine(stock_market)
        hasher.combine(upcoming_events)
        hasher.combine(weather)
    }
}
