//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponse : Jsonable {
    public static var LATEST:HomeResponse! = nil
    
    public let countries:HomeResponseCountries?, government:HomeResponseGovernment?, stock_market:HomeResponseStockMarket?, upcoming_events:HomeResponseUpcomingEvents?, weather:HomeResponseWeather?
    
    public init(countries: HomeResponseCountries?, government: HomeResponseGovernment?, stock_market: HomeResponseStockMarket?, upcoming_events: HomeResponseUpcomingEvents?, weather: HomeResponseWeather?) {
        self.countries = countries
        self.government = government
        self.stock_market = stock_market
        self.upcoming_events = upcoming_events
        self.weather = weather
    }
}
