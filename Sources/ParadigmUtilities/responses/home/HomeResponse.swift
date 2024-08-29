//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct HomeResponse : Jsonable {    
    public static var LATEST:HomeResponse! = nil
    
    public var countries:HomeResponse.Countries?
    public var government:HomeResponse.Government?
    public var news:HomeResponse.News?
    public var stock_market:HomeResponse.StockMarket?
    public var upcoming_events:HomeResponse.UpcomingEvents?
    public var weather:HomeResponse.Weather?
    
    public init(countries: HomeResponse.Countries?, government: HomeResponse.Government?, news: HomeResponse.News?, stock_market: HomeResponse.StockMarket?, upcoming_events: HomeResponse.UpcomingEvents?, weather: HomeResponse.Weather?) {
        self.countries = countries
        self.government = government
        self.news = news
        self.stock_market = stock_market
        self.upcoming_events = upcoming_events
        self.weather = weather
    }
}