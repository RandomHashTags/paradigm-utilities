//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateAgricultureValue : SovereignStateRankedValue {
    public typealias ValueKeys = SovereignStateAgricultureValueValueKeys
    
    public let info:SovereignStateInfo, world_rank:Int
    public var world_rank_max:Int
    public let year_of_data:Int, value:ExactFloat
    public var suffix:String?
    public let is_estimate:Bool
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: Int, suffix: String?, is_estimate: Bool, sources: EventSources?) {
        self.info = info
        self.world_rank = world_rank
        self.world_rank_max = world_rank_max
        self.year_of_data = year_of_data
        self.value = ExactFloat(value)
        self.suffix = suffix
        self.is_estimate = is_estimate
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateAgricultureValueValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .world_rank: return world_rank
        case .world_rank_max: return world_rank_max
        case .year_of_data: return year_of_data
        case .value: return value
        case .suffix: return suffix
        case .is_estimate: return is_estimate
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateAgricultureValueValueKeys, value: T) {
        switch key {
        case .suffix:
            suffix = value as? String
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SovereignStateAgricultureValueValueKeys : String, JsonableValueKeys {
    case info
    case world_rank
    case world_rank_max
    case year_of_data
    case value
    case suffix
    case is_estimate
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .suffix, .sources:
            return true
        default:
            return false
        }
    }
}
