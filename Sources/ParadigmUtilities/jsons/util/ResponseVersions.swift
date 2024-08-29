//
//  ResponseVersions.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct ResponseVersions : Jsonable {
    public let api_version:Int, server_version:SemanticVersion, app_version:SemanticVersion
    
    // Countries
    public let country_filters:Int, country_information:Int, country_subdivision_information:Int
    // Upcoming Events
    public let movie_production_companies:Int, movie_production_company_information:Int
    
    public init(api_version: Int, server_version: SemanticVersion, app_version: SemanticVersion, country_filters: Int, country_information: Int, country_subdivision_information: Int, movie_production_companies: Int, movie_production_company_information: Int) {
        self.api_version = api_version
        self.server_version = server_version
        self.app_version = app_version
        self.country_filters = country_filters
        self.country_information = country_information
        self.country_subdivision_information = country_subdivision_information
        self.movie_production_companies = movie_production_companies
        self.movie_production_company_information = movie_production_company_information
    }
}
