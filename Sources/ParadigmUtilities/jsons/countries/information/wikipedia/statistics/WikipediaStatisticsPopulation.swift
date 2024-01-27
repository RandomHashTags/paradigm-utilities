//
//  WikipediaStatisticsPopulation.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

import Foundation

public struct WikipediaStatisticsPopulation : Jsonable {
    public typealias JSONKeys = WikipediaStatisticsPopulationValueKeys
    
    public var total:String?, density:String?, median_household_income:String?
    
    public init(total: String?, density: String?, median_household_income: String?) {
        self.total = total
        self.density = density
        self.median_household_income = median_household_income
    }
    
    public func getKeyValue(key: WikipediaStatisticsPopulationValueKeys) -> Any? {
        switch key {
        case .total: return total
        case .density: return density
        case .median_household_income: return median_household_income
        }
    }
    public mutating func setKeyValue<T>(key: WikipediaStatisticsPopulationValueKeys, value: T) {
        switch key {
        case .total:
            total = value as? String
            break
        case .density:
            density = value as? String
            break
        case .median_household_income:
            median_household_income = value as? String
            break
        }
    }
}

public enum WikipediaStatisticsPopulationValueKeys : String, JsonableKeys {
    case total
    case density
    case median_household_income
    
    public var is_translatable : Bool {
        switch self {
        case .total, .density, .median_household_income:
            return true
        }
    }
}
