//
//  SovereignStateRankingInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValue : SovereignStateRankedValue {
    public typealias ValueKeys = SovereignStateRankingInfoValueValueKeys
    
    public let info:SovereignStateInfo, defcon:Int
    public var world_rank:Int, world_rank_max:Int
    public let year_of_data:Int, value:RoundedFloat
    public var suffix:String?
    public let is_estimate:Bool
    public var values:[SovereignStateRankingInfoValueOther]?, sources:EventSources?
    
    public init(info: SovereignStateInfo, defcon: Int, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: Int, suffix: String?, is_estimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, world_rank: world_rank, world_rank_max: world_rank_max, year_of_data: year_of_data, value: RoundedFloat(value), suffix: suffix, is_estimate: is_estimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: Int64, suffix: String?, is_estimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, world_rank: world_rank, world_rank_max: world_rank_max, year_of_data: year_of_data, value: RoundedFloat(value), suffix: suffix, is_estimate: is_estimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: RoundedFloat, suffix: String?, is_estimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.info = info
        self.defcon = defcon
        self.world_rank = world_rank
        self.world_rank_max = world_rank_max
        self.year_of_data = year_of_data
        self.value = value
        self.suffix = suffix
        self.is_estimate = is_estimate
        self.values = values
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateRankingInfoValueValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .defcon: return defcon
        case .world_rank: return world_rank
        case .max_world_rank: return world_rank_max
        case .year_of_data: return year_of_data
        case .value: return value
        case .suffix: return suffix
        case .is_estimate: return is_estimate
        case .values: return values
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateRankingInfoValueValueKeys, value: T) {
        switch key {
        case .suffix:
            suffix = value as? String
            break
        case .values:
            values = value as? [SovereignStateRankingInfoValueOther]
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SovereignStateRankingInfoValueValueKeys : String, JsonableValueKeys {
    case info
    case defcon
    case world_rank
    case max_world_rank
    case year_of_data
    case value
    case suffix
    case is_estimate
    case values
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .suffix, .values, .sources:
            return true
        default:
            return false
        }
    }
}
