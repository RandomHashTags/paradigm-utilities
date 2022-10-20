//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseCountries : Jsonable {
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
}
