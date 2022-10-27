//
//  WikipediaStatisticsArea.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

import Foundation

public struct WikipediaStatisticsArea : Jsonable {
    public typealias TranslationKeys = WikipediaStatisticsAreaTranslationKeys
    
    public var total:String?, water:String?, land:String?
    
    public init(total: String?, water: String?, land: String?) {
        self.total = total
        self.water = water
        self.land = land
    }
    
    public func getKeyValue(key: WikipediaStatisticsAreaTranslationKeys) -> Any? {
        switch key {
        case .total: return total
        case .water: return water
        case .land: return land
        }
    }
    public mutating func setKeyValue<T>(key: WikipediaStatisticsAreaTranslationKeys, value: T) {
        switch key {
        case .total:
            total = value as? String
            break
        case .water:
            water = value as? String
            break
        case .land:
            land = value as? String
            break
        }
    }
}

public enum WikipediaStatisticsAreaTranslationKeys : String, JsonableTranslationKey {
    case total
    case water
    case land
}
