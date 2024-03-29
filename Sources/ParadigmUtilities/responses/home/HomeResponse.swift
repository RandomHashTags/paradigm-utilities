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
    
    @CodableOmittable public var countries:HomeResponseCountries?
    @CodableOmittable public var government:HomeResponseGovernment?
    @CodableOmittable public var news:HomeResponseNews?
    @CodableOmittable public var stock_market:HomeResponseStockMarket?
    public var upcoming_events:HomeResponseUpcomingEvents?
    @CodableOmittable public var weather:HomeResponseWeather?
    
    public init(countries: HomeResponseCountries?, government: HomeResponseGovernment?, news: HomeResponseNews?, stock_market: HomeResponseStockMarket?, upcoming_events: HomeResponseUpcomingEvents?, weather: HomeResponseWeather?) {
        self._countries = CodableOmittable(countries)
        self._government = CodableOmittable(government)
        self._news = CodableOmittable(news)
        self._stock_market = CodableOmittable(stock_market)
        self.upcoming_events = upcoming_events
        self._weather = CodableOmittable(weather)
    }
    
    public func getKeyValue(key: HomeResponseValueKeys) -> Any? {
        switch key {
        case .countries: return _countries
        case .government: return _government
        case .news: return _news
        case .stock_market: return _stock_market
        case .upcoming_events: return upcoming_events
        case .weather: return _weather
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseValueKeys, value: T) {
        switch key {
        case .countries:
            _countries = value as! CodableOmittable<HomeResponseCountries>
            break
        case .government:
            _government = value as! CodableOmittable<HomeResponseGovernment>
            break
        case .news:
            _news = value as! CodableOmittable<HomeResponseNews>
            break
        case .stock_market:
            _stock_market = value as! CodableOmittable<HomeResponseStockMarket>
            break
        case .upcoming_events:
            upcoming_events = value as? HomeResponseUpcomingEvents
            break
        case .weather:
            _weather = value as! CodableOmittable<HomeResponseWeather>
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
    
    public var is_translatable : Bool {
        return true
    }
    public var is_omittable : Bool {
        switch self {
        case .countries, .government, .news, .stock_market, .weather:
            return true
        default:
            return false
        }
    }
}
