//
//  WikipediaStatistics.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct WikipediaStatistics : Jsonable {
    public typealias ValueKeys = WikipediaStatisticsValueKeys
    
    public var area:WikipediaStatisticsArea?
    public var elevation:WikipediaStatisticsElevation?
    public var dimensions:WikipediaStatisticsDimensions?
    public var population:WikipediaStatisticsPopulation?
    public let governmentURL:String?
    
    public init(area: WikipediaStatisticsArea?, elevation: WikipediaStatisticsElevation?, dimensions: WikipediaStatisticsDimensions?, population: WikipediaStatisticsPopulation?, governmentURL: String?) {
        self.area = area
        self.elevation = elevation
        self.dimensions = dimensions
        self.population = population
        self.governmentURL = governmentURL
    }
    
    public func getKeyValue(key: WikipediaStatisticsValueKeys) -> Any? {
        switch key {
        case .area: return area
        case .elevation: return elevation
        case .dimensions: return dimensions
        case .population: return population
        case .governmentURL: return governmentURL
        }
    }
    public mutating func setKeyValue<T>(key: WikipediaStatisticsValueKeys, value: T) {
        switch key {
        case .area:
            area = value as? WikipediaStatisticsArea
            break
        case .elevation:
            elevation = value as? WikipediaStatisticsElevation
            break
        case .dimensions:
            dimensions = value as? WikipediaStatisticsDimensions
            break
        case .population:
            population = value as? WikipediaStatisticsPopulation
            break
        default:
            break
        }
    }
}

public enum WikipediaStatisticsValueKeys : String, JsonableValueKeys {
    case area
    case elevation
    case dimensions
    case population
    case governmentURL
    
    public func isTranslatable() -> Bool {
        switch self {
        case .area, .elevation, .dimensions, .population:
            return true
        default:
            return false
        }
    }
}
