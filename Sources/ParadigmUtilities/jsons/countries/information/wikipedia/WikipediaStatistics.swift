//
//  WikipediaStatistics.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct WikipediaStatistics : Jsonable {
    public typealias TranslationKeys = WikipediaStatisticsTranslationKeys
    public typealias OmittableKeys = WikipediaStatisticsOmittableKeys
    
    @CodableOmittable public var area:WikipediaStatisticsArea?
    @CodableOmittable public var elevation:WikipediaStatisticsElevation?
    @CodableOmittable public var dimensions:WikipediaStatisticsDimensions?
    @CodableOmittable public var population:WikipediaStatisticsPopulation?
    public let governmentURL:String?
    
    public init(area: WikipediaStatisticsArea?, elevation: WikipediaStatisticsElevation?, dimensions: WikipediaStatisticsDimensions?, population: WikipediaStatisticsPopulation?, governmentURL: String?) {
        self._area = CodableOmittable(area)
        self._elevation = CodableOmittable(elevation)
        self._dimensions = CodableOmittable(dimensions)
        self._population = CodableOmittable(population)
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
            _area = CodableOmittable(value as? WikipediaStatisticsArea)
            break
        case .elevation:
            _elevation = CodableOmittable(value as? WikipediaStatisticsElevation)
            break
        case .dimensions:
            _dimensions = CodableOmittable(value as? WikipediaStatisticsDimensions)
            break
        case .population:
            _population = CodableOmittable(value as? WikipediaStatisticsPopulation)
            break
        }
    }
    
    public func getOmittableKeyValue(key: WikipediaStatisticsOmittableKeys) -> (any CodableOmittableProtocol)? {
        switch key {
        case .area: return _area
        case .elevation: return _elevation
        case .dimensions: return _dimensions
        case .population: return _population
        }
    }
    public mutating func setOmittableKeyValue<T: CodableOmittableProtocol>(key: WikipediaStatisticsOmittableKeys, value: T) {
        switch key {
        case .area:
            _area = value as! CodableOmittable<WikipediaStatisticsArea>
            break
        case .elevation:
            _elevation = value as! CodableOmittable<WikipediaStatisticsElevation>
            break
        case .dimensions:
            _dimensions = value as! CodableOmittable<WikipediaStatisticsDimensions>
            break
        case .population:
            _population = value as! CodableOmittable<WikipediaStatisticsPopulation>
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
public enum WikipediaStatisticsOmittableKeys : String, JsonableOmittableKey {
    case area
    case elevation
    case dimensions
    case population
}
