//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseCountries : Jsonable {
    public let filters:CountryFiltersResponse?
    
    public init(filters: CountryFiltersResponse?) {
        self.filters = filters
    }
}
