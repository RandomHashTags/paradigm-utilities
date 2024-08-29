//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponse : Jsonable {    
    public static var LATEST:HomeResponse! = nil
    
    public var countries:HomeResponse.Countries?
    public var government:HomeResponse.Government?
    public var news:HomeResponseNews?
    public var stock_market:HomeResponseStockMarket?
    public var upcoming_events:HomeResponseUpcomingEvents?
    public var weather:HomeResponseWeather?
    
    public init(countries: HomeResponse.Countries?, government: HomeResponse.Government?, news: HomeResponseNews?, stock_market: HomeResponseStockMarket?, upcoming_events: HomeResponseUpcomingEvents?, weather: HomeResponseWeather?) {
        self.countries = countries
        self.government = government
        self.news = news
        self.stock_market = stock_market
        self.upcoming_events = upcoming_events
        self.weather = weather
    }
}