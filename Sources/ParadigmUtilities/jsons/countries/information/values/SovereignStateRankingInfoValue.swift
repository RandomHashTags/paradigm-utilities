//
//  SovereignStateRankingInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValue : SovereignStateRankedValue {
    public typealias TranslationKeys = SovereignStateRankingInfoValueTranslationKeys
    
    public let info:SovereignStateInfo, defcon:Int
    public var worldRank:Int, maxWorldRank:Int
    public let yearOfData:Int, value:Double, valueType:NumberType
    public var suffix:String?
    public let isEstimate:Bool
    public var values:[SovereignStateRankingInfoValueOther]?, sources:EventSources?
    
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Int, suffix: String, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, worldRank: worldRank, maxWorldRank: maxWorldRank, yearOfData: yearOfData, value: Double(value), valueType: .integer, suffix: suffix, isEstimate: isEstimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Int64, suffix: String, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, worldRank: worldRank, maxWorldRank: maxWorldRank, yearOfData: yearOfData, value: Double(value), valueType: .long, suffix: suffix, isEstimate: isEstimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Double, valueType: NumberType, suffix: String, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.info = info
        self.defcon = defcon
        self.worldRank = worldRank
        self.maxWorldRank = maxWorldRank
        self.yearOfData = yearOfData
        self.value = value
        self.valueType = valueType
        self.suffix = suffix
        self.isEstimate = isEstimate
        self.values = values
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: SovereignStateRankingInfoValueTranslationKeys) -> Any? {
        switch key {
        case .suffix: return suffix
        case .values: return values
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: SovereignStateRankingInfoValueTranslationKeys, value: T) {
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
        }
    }
}

public enum SovereignStateRankingInfoValueTranslationKeys : String, JsonableTranslationKey {
    case suffix
    case values
    case sources
}
