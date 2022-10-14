//
//  WikipediaStatistics.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct WikipediaStatistics : Jsonable {
    public let area:WikipediaStatisticsArea?, elevation:WikipediaStatisticsElevation?, dimensions:WikipediaStatisticsDimensions?, population:WikipediaStatisticsPopulation?, govermentURL:String?
    
    public init(area: WikipediaStatisticsArea?, elevation: WikipediaStatisticsElevation?, dimensions: WikipediaStatisticsDimensions?, population: WikipediaStatisticsPopulation?, governmentURL: String?) {
        self.area = area
        self.elevation = elevation
        self.dimensions = dimensions
        self.population = population
        self.govermentURL = governmentURL
    }
}

public struct WikipediaStatisticsArea : Jsonable {
    public let total:String?, water:String?, land:String?
    
    public init(total: String?, water: String?, land: String?) {
        self.total = total
        self.water = water
        self.land = land
    }
}

public struct WikipediaStatisticsElevation : Jsonable {
    public let lowest:String?, highest:String?, median:String?
    
    public init(lowest: String?, highest: String?, median: String?) {
        self.lowest = lowest
        self.highest = highest
        self.median = median
    }
}

public struct WikipediaStatisticsDimensions : Jsonable {
    public let length:String?, width:String?
    
    public init(length: String?, width: String?) {
        self.length = length
        self.width = width
    }
}

public struct WikipediaStatisticsPopulation : Jsonable {
    public let total:String?, density:String?, medianHouseholdIncome:String?
    
    public init(total: String?, density: String?, medianHouseholdIncome: String?) {
        self.total = total
        self.density = density
        self.medianHouseholdIncome = medianHouseholdIncome
    }
}
