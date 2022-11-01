//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateAgricultureValue : SovereignStateRankedValue {
    public typealias ValueKeys = SovereignStateAgricultureValueValueKeys
    
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
    
    public func getKeyValue(key: SovereignStateAgricultureValueValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .worldRank: return worldRank
        case .maxWorldRank: return maxWorldRank
        case .yearOfData: return yearOfData
        case .value: return value
        case .valueType: return valueType
        case .suffix: return suffix
        case .isEstimate: return isEstimate
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
    case worldRank
    case maxWorldRank
    case yearOfData
    case value
    case valueType
    case suffix
    case isEstimate
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .suffix, .sources:
            return true
        default:
            return false
        }
    }
}
