//
//  WikipediaStatisticsElevation.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

import Foundation

public struct WikipediaStatisticsElevation : Jsonable {
    public typealias TranslationKeys = WikipediaStatisticsElevationTranslationKeys
    
    public var lowest:String?, highest:String?, median:String?
    
    public init(lowest: String?, highest: String?, median: String?) {
        self.lowest = lowest
        self.highest = highest
        self.median = median
    }
    
    public func getTranslationKeyValue(key: WikipediaStatisticsElevationTranslationKeys) -> Any? {
        switch key {
        case .lowest: return lowest
        case .highest: return highest
        case .median: return median
        }
    }
    public mutating func setTranslationKeyValue<T>(key: WikipediaStatisticsElevationTranslationKeys, value: T) {
        switch key {
        case .lowest:
            lowest = value as? String
            break
        case .highest:
            highest = value as? String
            break
        case .median:
            median = value as? String
            break
        }
    }
}

public enum WikipediaStatisticsElevationTranslationKeys : String, JsonableTranslationKey {
    case lowest
    case highest
    case median
}
