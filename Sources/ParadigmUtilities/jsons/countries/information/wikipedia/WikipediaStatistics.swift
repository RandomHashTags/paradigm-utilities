//
//  WikipediaStatistics.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct WikipediaStatistics : Jsonable {
    public typealias TranslationKeys = WikipediaStatisticsTranslationKeys
    
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
    
    public func getTranslationKeyValue(key: WikipediaStatisticsTranslationKeys) -> Any? {
        switch key {
        case .area: return area
        case .elevation: return elevation
        case .dimensions: return dimensions
        case .population: return population
        }
    }
    public mutating func setTranslationKeyValue<T>(key: WikipediaStatisticsTranslationKeys, value: T) {
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
        }
    }
}

public enum WikipediaStatisticsTranslationKeys : String, JsonableTranslationKey {
    case area
    case elevation
    case dimensions
    case population
}
