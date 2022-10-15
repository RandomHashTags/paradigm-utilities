//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseCountries : Jsonable {
    public let availability_categories:AvailabilityCategoriesResponse?, filters:[CountryFilter]?
    
    public init(availability_categories: AvailabilityCategoriesResponse?, filters: [CountryFilter]?) {
        self.availability_categories = availability_categories
        self.filters = filters
    }
}
