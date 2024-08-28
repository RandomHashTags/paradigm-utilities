//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponse : Jsonable {
    public typealias JSONKeys = HomeResponseValueKeys
    
    public static var LATEST:HomeResponse! = nil
    
    public var countries:HomeResponseCountries?
    public var government:HomeResponseGovernment?
    public var news:HomeResponseNews?
    public var stock_market:HomeResponseStockMarket?
    public var upcoming_events:HomeResponseUpcomingEvents?
    public var weather:HomeResponseWeather?
    
    public init(countries: HomeResponseCountries?, government: HomeResponseGovernment?, news: HomeResponseNews?, stock_market: HomeResponseStockMarket?, upcoming_events: HomeResponseUpcomingEvents?, weather: HomeResponseWeather?) {
        self.countries = countries
        self.government = government
        self.news = news
        self.stock_market = stock_market
        self.upcoming_events = upcoming_events
        self.weather = weather
    }
    
    public func getKeyValue(key: HomeResponseValueKeys) -> Any? {
        switch key {
        case .countries: return countries
        case .government: return government
        case .news: return news
        case .stock_market: return stock_market
        case .upcoming_events: return upcoming_events
        case .weather: return weather
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseValueKeys, value: T) {
        switch key {
        case .countries:
            countries = value as? HomeResponseCountries
            break
        case .government:
            government = value as? HomeResponseGovernment
            break
        case .news:
            news = value as? HomeResponseNews
            break
        case .stock_market:
            stock_market = value as? HomeResponseStockMarket
            break
        case .upcoming_events:
            upcoming_events = value as? HomeResponseUpcomingEvents
            break
        case .weather:
            weather = value as? HomeResponseWeather
            break
        }
    }
}

public enum HomeResponseValueKeys : String, JsonableKeys {
    case countries
    case government
    case news
    case stock_market
    case upcoming_events
    case weather
}
