//
//  CountryFiltersResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public final class CountryFiltersResponse : Jsonable {
    public static func == (lhs: CountryFiltersResponse, rhs: CountryFiltersResponse) -> Bool {
        return lhs.response_version == rhs.response_version && lhs.filters == rhs.filters
    }
    
    public let response_version:Int
    public var filters:[CountryFilter]!
    
    public init(response_version: Int, filters: [CountryFilter]!) {
        self.response_version = response_version
        self.filters = filters
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(response_version)
        hasher.combine(filters)
    }
}
