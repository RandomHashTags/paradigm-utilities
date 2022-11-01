//
//  HomeResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponse : Jsonable {
    public typealias ValueKeys = HomeResponseValueKeys
    
    public static func == (lhs: HomeResponse, rhs: HomeResponse) -> Bool {
        return lhs.countries == rhs.countries && lhs.government == rhs.government && lhs.stock_market == rhs.stock_market && lhs.upcoming_events == rhs.upcoming_events && lhs.weather == rhs.weather
    }
    
    public static var LATEST:HomeResponse! = nil
    
    public var countries:HomeResponseCountries?
    @CodableOmittable public var government:HomeResponseGovernment?
    @CodableOmittable public var stock_market:HomeResponseStockMarket?
    public var upcoming_events:HomeResponseUpcomingEvents?, weather:HomeResponseWeather?
    
    public init(countries: HomeResponseCountries?, government: HomeResponseGovernment?, stock_market: HomeResponseStockMarket?, upcoming_events: HomeResponseUpcomingEvents?, weather: HomeResponseWeather?) {
        self.countries = countries
        self._government = CodableOmittable(government)
        self._stock_market = CodableOmittable(stock_market)
        self.upcoming_events = upcoming_events
        self.weather = weather
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(countries)
        hasher.combine(_government)
        hasher.combine(_stock_market)
        hasher.combine(upcoming_events)
        hasher.combine(weather)
    }
    
    public func getKeyValue(key: HomeResponseValueKeys) -> Any? {
        switch key {
        case .countries: return countries
        case .government: return _government
        case .stock_market: return _stock_market
        case .upcoming_events: return upcoming_events
        case .weather: return weather
        }
    }
    public func setKeyValue<T>(key: HomeResponseValueKeys, value: T) {
        switch key {
        case .countries:
            countries = value as? HomeResponseCountries
            break
        case .government:
            _government = value as! CodableOmittable<HomeResponseGovernment>
            break
        case .stock_market:
            _stock_market = value as! CodableOmittable<HomeResponseStockMarket>
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

public enum HomeResponseValueKeys : String, JsonableValueKeys {
    case countries
    case government
    case stock_market
    case upcoming_events
    case weather
    
    public func isTranslatable() -> Bool {
        switch self {
        case .countries, .government, .stock_market, .upcoming_events, .weather:
            return true
        }
    }
    public func isOmittable() -> Bool {
        switch self {
        case .government, .stock_market:
            return true
        default:
            return false
        }
    }
}
