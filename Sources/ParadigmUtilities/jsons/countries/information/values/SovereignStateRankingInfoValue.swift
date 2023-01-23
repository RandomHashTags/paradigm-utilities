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
    public let year_of_data:Int, value:Double, valueType:NumberType
    public var suffix:String?
    public let is_estimate:Bool
    public var values:[SovereignStateRankingInfoValueOther]?, sources:EventSources?
    
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Int, suffix: String?, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, worldRank: worldRank, maxWorldRank: maxWorldRank, yearOfData: yearOfData, value: Double(value), valueType: .integer, suffix: suffix, isEstimate: isEstimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Int64, suffix: String?, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, worldRank: worldRank, maxWorldRank: maxWorldRank, yearOfData: yearOfData, value: Double(value), valueType: .long, suffix: suffix, isEstimate: isEstimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Double, valueType: NumberType, suffix: String?, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.info = info
        self.defcon = defcon
        self.world_rank = worldRank
        self.world_rank_max = maxWorldRank
        self.year_of_data = yearOfData
        self.value = value
        self.valueType = valueType
        self.suffix = suffix
        self.is_estimate = isEstimate
        self.values = values
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateRankingInfoValueValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .defcon: return defcon
        case .worldRank: return world_rank
        case .maxWorldRank: return world_rank_max
        case .yearOfData: return year_of_data
        case .value: return value
        case .valueType: return valueType
        case .suffix: return suffix
        case .isEstimate: return is_estimate
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
    case worldRank
    case maxWorldRank
    case yearOfData
    case value
    case valueType
    case suffix
    case isEstimate
    case values
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .suffix, .values, .sources:
            return true
        default:
            return false
        }
    }
}
