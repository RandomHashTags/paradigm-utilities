//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public extension Responses {
    struct Home : Jsonable {    
        public static var LATEST:Home! = nil
        
        public var countries:Countries.Home?
        public var government:Government.Home?
        public var news:News.Home?
        public var stock_market:StockMarket.Home?
        public var upcoming_events:UpcomingEvents.Home?
        public var weather:Weather.Home?
        
        public init(countries: Countries.Home?, government: Government.Home?, news: News.Home?, stock_market: StockMarket.Home?, upcoming_events: UpcomingEvents.Home?, weather: Weather.Home?) {
            self.countries = countries
            self.government = government
            self.news = news
            self.stock_market = stock_market
            self.upcoming_events = upcoming_events
            self.weather = weather
        }
    }
}
