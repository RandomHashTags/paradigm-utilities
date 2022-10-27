//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponse : Jsonable {
    public typealias TranslationKeys = HomeResponseTranslationKeys
    
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
    
    public func getKeyValue(key: HomeResponseTranslationKeys) -> Any? {
        switch key {
        case .countries: return countries
        case .government: return government
        case .stock_market: return stock_market
        case .upcoming_events: return upcoming_events
        case .weather: return weather
        }
    }
    public func setKeyValue<T>(key: HomeResponseTranslationKeys, value: T) {
        switch key {
        case .countries:
            countries = value as? HomeResponseCountries
            break
        case .government:
            government = value as? HomeResponseGovernment
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

public enum HomeResponseTranslationKeys : String, JsonableTranslationKey {
    case countries
    case government
    case stock_market
    case upcoming_events
    case weather
}
