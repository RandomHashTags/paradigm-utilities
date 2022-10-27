//
//  ResponseVersions.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct ResponseVersions : Jsonable {
    public let apiVersion:Int, serverVersion:SemanticVersion, appVersion:SemanticVersion
    
    public let country_filters:Int
    public let upcoming_event_movie_production_companies:Int
    
    public init(apiVersion: Int, serverVersion: SemanticVersion, appVersion: SemanticVersion, country_filters: Int, upcoming_event_movie_production_companies: Int) {
        self.apiVersion = apiVersion
        self.serverVersion = serverVersion
        self.appVersion = appVersion
        self.country_filters = country_filters
        self.upcoming_event_movie_production_companies = upcoming_event_movie_production_companies
    }
}
