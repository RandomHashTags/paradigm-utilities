//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateAgricultureValue : SovereignStateRankedValue {
    public typealias TranslationKeys = SovereignStateAgricultureValueTranslationKeys
    
    public let info:SovereignStateInfo, worldRank:Int
    public var maxWorldRank:Int
    public let yearOfData:Int, value:Double, valueType:NumberType
    public var suffix:String?
    public let isEstimate:Bool
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Int, suffix: String?, isEstimate: Bool, sources: EventSources?) {
        self.info = info
        self.worldRank = worldRank
        self.maxWorldRank = maxWorldRank
        self.yearOfData = yearOfData
        self.value = Double(value)
        self.valueType = NumberType.integer
        self.suffix = suffix
        self.isEstimate = isEstimate
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateAgricultureValueTranslationKeys) -> Any? {
        switch key {
        case .suffix: return suffix
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateAgricultureValueTranslationKeys, value: T) {
        switch key {
        case .suffix:
            suffix = value as? String
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SovereignStateAgricultureValueTranslationKeys : String, JsonableTranslationKey {
    case suffix
    case sources
}
