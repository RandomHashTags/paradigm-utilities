//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseCountries : HomeResponseProtocol {
    public typealias TranslationKeys = HomeResponseCountriesTranslationKeys
    
    public static func == (lhs: HomeResponseCountries, rhs: HomeResponseCountries) -> Bool {
        return lhs.filters == rhs.filters
    }
    
    public var filters:CountryFiltersResponse?
    
    public init(filters: CountryFiltersResponse?) {
        self.filters = filters
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(filters)
    }
    
    public func getKeyValue(key: HomeResponseCountriesTranslationKeys) -> Any? {
        switch key {
        case .filters: return filters
        }
    }
    public func setKeyValue<T>(key: HomeResponseCountriesTranslationKeys, value: T) {
        switch key {
        case .filters:
            filters = value as? CountryFiltersResponse
            break
        }
    }
}

public enum HomeResponseCountriesTranslationKeys : String, JsonableTranslationKey {
    case filters
}
