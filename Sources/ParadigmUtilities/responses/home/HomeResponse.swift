//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponse : Jsonable {
    public let countries:HomeResponseCountries?, stock_market:HomeResponseStockMarket?, upcoming_events:HomeResponseUpcomingEvents?, weather:HomeResponseWeather?
    
    public init(countries: HomeResponseCountries?, stock_market: HomeResponseStockMarket?, upcoming_events: HomeResponseUpcomingEvents?, weather: HomeResponseWeather?) {
        self.countries = countries
        self.stock_market = stock_market
        self.upcoming_events = upcoming_events
        self.weather = weather
    }
}
