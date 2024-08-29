//
//  WikipediaStatistics.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

public struct WikipediaStatistics : Jsonable {    
    public var area:WikipediaStatisticsArea?
    public var elevation:WikipediaStatisticsElevation?
    public var dimensions:WikipediaStatisticsDimensions?
    public var population:WikipediaStatisticsPopulation?
    public let government_url:String?
    
    public init(area: WikipediaStatisticsArea?, elevation: WikipediaStatisticsElevation?, dimensions: WikipediaStatisticsDimensions?, population: WikipediaStatisticsPopulation?, government_url: String?) {
        self.area = area
        self.elevation = elevation
        self.dimensions = dimensions
        self.population = population
        self.government_url = government_url
    }
}